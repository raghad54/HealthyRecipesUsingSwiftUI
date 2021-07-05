//
//  GitHubRepoListVC.swift
//  GitHubRepoTask
//
//  Created by Raghad's Mac on 05/07/2021.
//

import Foundation
import UIKit

// MARK: - ...  ViewController - Vars
class GitHubRepoListVC: BaseController {
    var presenter: GitHubRepoListPresenter?
    var router: GitHubRepoListRouter?
    
    @IBOutlet weak var repoListTableView: UITableView! {
        didSet {
            repoListTableView.dataSource = self
            repoListTableView.delegate = self
            
        }
    }
    @IBOutlet weak var searchBar: UISearchBar!
    
    var repoListArray = [GitHubRepoListModel]()
    var searchData = [GitHubRepoListModel]()
   // var filteredReposName: [String]!
    var searchController: UISearchController?
    var isSearching = false
}

// MARK: - ...  LifeCycle
extension GitHubRepoListVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter = .init()
        presenter?.view = self
        startLoading()
        presenter?.fetchRepoList()
        router = .init()
        router?.view = self
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter = nil
        router = nil
    }
}
// MARK: - ...  Functions
extension GitHubRepoListVC {
    func setup() {
    setUpNib()
    setUpSearchBar()
    }
    
    private func setUpSearchBar() {
        searchBar.delegate = self
        let textFieldInsideSearchBar = self.searchBar.value(forKey: "searchField") as! UITextField
        textFieldInsideSearchBar.leftViewMode = UITextField.ViewMode.never
        searchBar.barTintColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        searchBar.searchTextField.backgroundColor =  #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        self.searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.showsCancelButton = true
        searchBar.searchTextField.placeholder = "Search"
        searchBar.searchTextField.textColor = UIColor.lightGray
    }
    
    private func setUpNib() {
        repoListTableView.register(UINib(nibName: GitHubTableCell.ID, bundle: nil), forCellReuseIdentifier: GitHubTableCell.ID)
    }
}
// MARK: - ...  View Contract
extension GitHubRepoListVC: GitHubRepoListViewContract {
    func didFetchSuccessfully(data: [GitHubRepoListModel]?) {
        stopLoading()
        self.repoListArray = data ?? []
        if self.repoListArray.isEmpty {
            
        } else  {
            DispatchQueue.main.async {
                self.repoListTableView.reloadData()
            }
        }
    }
    
    func startLoading() {
      //  self.showIndicator(withTitle: "Appricate your Waiting", and: "Loading ...")
    }
    
    func stopLoading() {
       // self.hideIndicator()
    }
    
    func didError(error: String?) {
        
    }
    
}

extension GitHubRepoListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching  {
            return searchData.count
        } else {
            return repoListArray.count
      }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = repoListTableView.dequeueReusableCell(withIdentifier: GitHubTableCell.ID, for: indexPath) as! GitHubTableCell
        if isSearching {
            cell.bind(data: searchData[indexPath.row])
        } else  {
            cell.bind(data: repoListArray[indexPath.row])
        }
        return cell
    }
}

extension GitHubRepoListVC:  UISearchBarDelegate, UITextFieldDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchData = searchText.isEmpty ? repoListArray : repoListArray.filter{ $0.name!.range(of: searchText, options: .caseInsensitive) != nil }
        isSearching = true
        repoListTableView.reloadData()
    }
    func didPresentSearchController(searchController: UISearchController) {
        self.searchBar.showsCancelButton = false
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.showsCancelButton = false
        searchBar.endEditing(true)
        self.searchBar.resignFirstResponder()
        self.searchData.removeAll()
        isSearching = false
        repoListTableView.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        DispatchQueue.main.async {
        if let cancelButton = searchBar.value(forKey: "cancelButton") as? UIButton {
            cancelButton.isEnabled = true
            self.isSearching = false
            self.searchData.removeAll()
            self.repoListTableView.reloadData()
            }
        }
    }
    
}

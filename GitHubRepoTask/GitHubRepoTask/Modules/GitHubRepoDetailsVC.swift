//
//  GitHubRepoDetailsVC.swift
//  GitHubRepoTask
//
//  Created by Raghad's Mac on 05/07/2021.
//

import Foundation
import UIKit

// MARK: - ...  ViewController - Vars
class GitHubRepoDetailsVC: BaseController {
    var presenter: GitHubRepoDetailsPresenter?
    var router: GitHubRepoDetailsRouter?
    
    @IBOutlet weak var repoImageView: UIImageView!
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var repoDetailsUrlLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    
    static func create(repoImageURL: String?, repoName: String?, repoURL: String?) -> GitHubRepoDetailsVC {
        let viewController = R.storyboard.gitHubRepoDetailsStoryboard.gitHubRepoDetailsVC()!
        viewController.imageURL = repoImageURL
        viewController.repoName = repoName
        viewController.repoURL = repoURL
        return viewController
    }
    
    var imageURL: String?
    var repoName: String?
    var repoURL: String?
}

// MARK: - ...  LifeCycle
extension GitHubRepoDetailsVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        startLoading()
        setup()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter = .init()
        presenter?.view = self
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
extension GitHubRepoDetailsVC {
    func setup() {
        bind()
        setUpView()
    }
    
    private func setUpView() {
        self.repoImageView.roundCorners(.allCorners, radius: 56)
    }
    
    private func bind() {
        self.stopLoading()
        let url = URL(string:imageURL ?? "")
        let data = try? Data(contentsOf: url!)
        self.repoImageView.image = UIImage(data: data!)
        self.repoNameLabel.text = repoName ?? ""
        self.repoDetailsUrlLabel.text = repoURL ?? ""
    }
}
// MARK: - ...  View Contract
extension GitHubRepoDetailsVC: GitHubRepoDetailsViewContract {
    func didError(error: String?) {
        
    }
    
    
}

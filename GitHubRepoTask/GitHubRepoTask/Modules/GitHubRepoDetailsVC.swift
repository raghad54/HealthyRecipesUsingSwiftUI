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
}

// MARK: - ...  LifeCycle
extension GitHubRepoDetailsVC {
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }
}
// MARK: - ...  View Contract
extension GitHubRepoDetailsVC: GitHubRepoDetailsViewContract {
    func startLoading() {
        
    }
    
    func stopLoading() {
        
    }
    
    func didError(error: String?) {
        
    }
    
}

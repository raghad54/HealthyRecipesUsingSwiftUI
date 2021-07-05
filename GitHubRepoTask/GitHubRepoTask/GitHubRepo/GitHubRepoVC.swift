//
//  GitHubRepoVC.swift
//  GitHubRepoTask
//
//  Created by Raghad's Mac on 05/07/2021.
//

import Foundation
import UIKit

// MARK: - ...  ViewController - Vars
class GitHubRepoVC: BaseController {
    var presenter: GitHubRepoPresenter?
    var router: GitHubRepoRouter?
}

// MARK: - ...  LifeCycle
extension GitHubRepoVC {
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
extension GitHubRepoVC {
    func setup() {
    }
}
// MARK: - ...  View Contract
extension GitHubRepoVC: GitHubRepoViewContract {
}

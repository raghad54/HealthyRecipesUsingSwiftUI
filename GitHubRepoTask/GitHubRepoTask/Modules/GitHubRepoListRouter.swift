//
//  GitHubRepoListRouter.swift
//  GitHubRepoTask
//
//  Created by Raghad's Mac on 05/07/2021.
//

import Foundation

// MARK: - ...  Router
class GitHubRepoListRouter: Router {
    typealias PresentingView = GitHubRepoListVC
    weak var view: PresentingView?
    deinit {
        self.view = nil
    }
}

extension GitHubRepoListRouter: GitHubRepoListRouterContract {
    
}

//
//  GitHubRepoRouter.swift
//  GitHubRepoTask
//
//  Created by Raghad's Mac on 05/07/2021.
//

import Foundation

// MARK: - ...  Router
class GitHubRepoRouter: Router {
    typealias PresentingView = GitHubRepoVC
    weak var view: PresentingView?
    deinit {
        self.view = nil
    }
}

extension GitHubRepoRouter: GitHubRepoRouterContract {
    
}

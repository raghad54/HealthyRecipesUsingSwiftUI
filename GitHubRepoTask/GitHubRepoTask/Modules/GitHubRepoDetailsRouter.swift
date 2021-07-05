//
//  GitHubRepoDetailsRouter.swift
//  GitHubRepoTask
//
//  Created by Raghad's Mac on 05/07/2021.
//

import Foundation

// MARK: - ...  Router
class GitHubRepoDetailsRouter: Router {
    typealias PresentingView = GitHubRepoDetailsVC
    weak var view: PresentingView?
    deinit {
        self.view = nil
    }
}

extension GitHubRepoDetailsRouter: GitHubRepoDetailsRouterContract {
    
}

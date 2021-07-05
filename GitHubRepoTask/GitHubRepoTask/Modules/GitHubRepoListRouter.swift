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
    func pushToDetails(imageUrl: String?, repoName: String?, repoUrl: String?) {
        view?.push(GitHubRepoDetailsVC.create(repoImageURL: imageUrl ?? "", repoName: repoName ?? "", repoURL: repoUrl ?? ""), true)
    }
    
}

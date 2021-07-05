//
//  GitHubRepoPresenter.swift
//  GitHubRepoTask
//
//  Created by Raghad's Mac on 05/07/2021.
//

import Foundation

// MARK: - ...  Presenter
class GitHubRepoPresenter: BasePresenter<GitHubRepoViewContract> {
}
// MARK: - ...  Presenter Contract
extension GitHubRepoPresenter: GitHubRepoPresenterContract {
}
// MARK: - ...  Example of network response
extension GitHubRepoPresenter {
    func fetchResponse<T: GitHubRepoModel>(response: NetworkResponse<T>) {
        switch response {
            case .success(_):
                break
            case .failure(_):
                break
        }
    }
}

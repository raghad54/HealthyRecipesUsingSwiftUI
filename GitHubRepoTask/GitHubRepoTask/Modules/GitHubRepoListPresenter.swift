//
//  GitHubRepoListPresenter.swift
//  GitHubRepoTask
//
//  Created by Raghad's Mac on 05/07/2021.
//

import Foundation

// MARK: - ...  Presenter
class GitHubRepoListPresenter: BasePresenter<GitHubRepoListViewContract> {
    func fetchRepoList() {
        
        APIClient.requestData(url: "repositories", method: .get, parameters: nil) { result in
            switch result {
            case .success(let model):
                print(model)
                self.view?.didFetchSuccessfully(data: model)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

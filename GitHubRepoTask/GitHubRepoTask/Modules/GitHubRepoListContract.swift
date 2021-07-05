//
//  GitHubRepoListContract.swift
//  GitHubRepoTask
//
//  Created by Raghad's Mac on 05/07/2021.
//

import Foundation

// MARK: - ...  Presenter Contract
protocol GitHubRepoListPresenterContract: PresenterProtocol {
    func fetchRepoList()
}
// MARK: - ...  View Contract
protocol GitHubRepoListViewContract: PresentingViewProtocol {
    func didFetchSuccessfully(data: [GitHubRepoListModel]?)
}
// MARK: - ...  Router Contract
protocol GitHubRepoListRouterContract: Router, RouterProtocol {
}

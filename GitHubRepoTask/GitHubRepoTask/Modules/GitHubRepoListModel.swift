//
//  GitHubRepoListModel.swift
//  GitHubRepoTask
//
//  Created by Raghad's Mac on 05/07/2021.
//

import Foundation

// MARK: - ...  Entity
class GitHubRepoListModel: Codable {
    var id : Int?
    var node_id : String?
    var name : String?
    var full_name : String?
    var isPrivate : Bool?
    var owner : Owner?
    var html_url : String?
    var description : String?
    var fork : Bool?
    var url : String?
    var forks_url : String?
    var keys_urls_url : String?
    var collaborators_url : String?
    var teams_url : String?
    var hooks_url : String?
    var issue_events_url : String?
    var events_url : String?
    var assignees_url : String?
    var branches_url : String?
    var tags_url : String?
    var blobs_url : String?
    var git_tags_url : String?
    var git_refs_url : String?
    var trees_url : String?
    var statuses_url : String?
    var languages_url : String?
    var stargazers_url : String?
    var contributors_url : String?
    var subscribers_url : String?
    var subscription_url : String?
    var commits_url : String?
    var git_commits_url : String?
    var comments_url : String?
    var issue_comment_url : String?
    var contents_url : String?
    var compare_url : String?
    var merges_url : String?
    var archive_url : String?
    var downloads_url : String?
    var issues_url : String?
    var pulls_url : String?
    var milestones_url : String?
    var notifications_url : String?
    var labels_url : String?
    var releases_url : String?
    var deployments_url : String?
    

//    enum CodingKeys: String, CodingKey {
//
//        case id = "id"
//        case node_id = "node_id"
//        case name = "name"
//        case full_name = "full_name"
//        case isPrivate = "private"
//        case owner = "owner"
//        case html_url = "html_url"
//        case description = "description"
//        case fork = "fork"
//        case url = "url"
//        case forks_url = "forks_url"
//        case keys_url = "keys_url"
//        case collaborators_url = "collaborators_url"
//        case teams_url = "teams_url"
//        case hooks_url = "hooks_url"
//        case issue_events_url = "issue_events_url"
//        case events_url = "events_url"
//        case assignees_url = "assignees_url"
//        case branches_url = "branches_url"
//        case tags_url = "tags_url"
//        case blobs_url = "blobs_url"
//        case git_tags_url = "git_tags_url"
//        case git_refs_url = "git_refs_url"
//        case trees_url = "trees_url"
//        case statuses_url = "statuses_url"
//        case languages_url = "languages_url"
//        case stargazers_url = "stargazers_url"
//        case contributors_url = "contributors_url"
//        case subscribers_url = "subscribers_url"
//        case subscription_url = "subscription_url"
//        case commits_url = "commits_url"
//        case git_commits_url = "git_commits_url"
//        case comments_url = "comments_url"
//        case issue_comment_url = "issue_comment_url"
//        case contents_url = "contents_url"
//        case compare_url = "compare_url"
//        case merges_url = "merges_url"
//        case archive_url = "archive_url"
//        case downloads_url = "downloads_url"
//        case issues_url = "issues_url"
//        case pulls_url = "pulls_url"
//        case milestones_url = "milestones_url"
//        case notifications_url = "notifications_url"
//        case labels_url = "labels_url"
//        case releases_url = "releases_url"
//        case deployments_url = "deployments_url"
//    }

}

class Owner : Codable {
    var login : String?
    var id : Int?
    var node_id : String?
    var avatar_url : String?
    var gravatar_id : String?
    var url : String?
    var html_url : String?
    var followers_url : String?
    var following_url : String?
    var gists_url : String?
    var starred_url : String?
    var subscriptions_url : String?
    var organizations_url : String?
    var repos_url : String?
    var events_url : String?
    var received_events_url : String?
    var type : String?
    var site_admin : Bool?

//    enum CodingKeys: String, CodingKey {
//
//        case login = "login"
//        case id = "id"
//        case node_id = "node_id"
//        case avatar_url = "avatar_url"
//        case gravatar_id = "gravatar_id"
//        case url = "url"
//        case html_url = "html_url"
//        case followers_url = "followers_url"
//        case following_url = "following_url"
//        case gists_url = "gists_url"
//        case starred_url = "starred_url"
//        case subscriptions_url = "subscriptions_url"
//        case organizations_url = "organizations_url"
//        case repos_url = "repos_url"
//        case events_url = "events_url"
//        case received_events_url = "received_events_url"
//        case type = "type"
//        case site_admin = "site_admin"
//    }

}

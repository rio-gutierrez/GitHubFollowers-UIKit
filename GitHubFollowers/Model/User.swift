//
//  User.swift
//  GitHubFollowers
//
//  Created by Mario Luis on 12/31/23.
//

import Foundation

/// API docs for getting a single user, given its username [here](https://docs.github.com/en/rest/users/users?apiVersion=2022-11-28#get-a-user).
struct User: Codable {
    var login: String
    var avatarUrl: String
    var publicRepos: Int
    var publicGists: Int
    var hmtlUrl: String
    var following: Int
    var followers: Int
    var createdAt: String
    
    // non-mandatory fields
    var name: String?
    var location: String?
    var bio: String?
}

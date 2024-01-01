//
//  Follower.swift
//  GitHubFollowers
//
//  Created by Mario Luis on 12/31/23.
//

import Foundation

/// API docs for user's followers: [here](https://docs.github.com/en/rest/users/followers?apiVersion=2022-11-28#list-followers-of-a-user).
struct Follower: Codable {
    var login: String
    var avatarUrl: String
}

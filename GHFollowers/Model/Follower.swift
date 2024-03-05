//
//  Follower.swift
//  GHFollowers
//
//  Created by Mario Luis on 2/11/24
//

import Foundation

/// API docs for user's followers: [here](https://docs.github.com/en/rest/users/followers?apiVersion=2022-11-28#list-followers-of-a-user)
struct Follower: Codable, Hashable {
    var login: String
    var avatarUrl: String
}

//
//  User.swift
//  GHFollowers
//
//  Created by Mario Luis on 2/11/24
//

import Foundation

/// API docs for getting a single user, given its username [here](https://docs.github.com/en/rest/users/users?apiVersion=2022-11-28#get-a-user).
struct User: Codable {
    let login: String
    let avatarUrl: String
    let publicRepos: Int
    let publicGists: Int
    let htmlUrl: String
    let following: Int
    let followers: Int
    let createdAt: Date
	
	// non-mandatory fields
	var name: String?
	var location: String?
	var bio: String?
}

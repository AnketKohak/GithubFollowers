//
//  User.swift
//  GithubFollowers
//
//  Created by Anket Kohak on 17/09/25.
//

import Foundation

struct User: Codable{
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists : Int
    var htmlUrl: String
    var following: Int
    var followers: Int
    var createdAt: String
}

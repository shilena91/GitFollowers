//
//  Followers.swift
//  GitFollowers
//
//  Created by Hoang on 24.5.2020.
//  Copyright © 2020 Hoang. All rights reserved.
//

import Foundation

struct Follower: Codable, Hashable {
    var login: String
    var avatarUrl: String
}

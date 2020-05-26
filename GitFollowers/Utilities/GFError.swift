//
//  ErrorMessage.swift
//  GitFollowers
//
//  Created by Hoang on 24.5.2020.
//  Copyright © 2020 Hoang. All rights reserved.
//

import Foundation

enum GFError: String, Error {
    
    case invalidUsername    = "This username creaed an invalid request. Please try again."
    case unableToComplete   = "Unable to complete your request. Please check your internet connection."
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData        = "Data received from the server was invalid. Please try again."
    case parseJsonFailed    = "Cannot decode JSON data."
    case unableToFavorite   = "There was an error favoriting this user. Please try again."
    case alreadyInFavorite  = "This user is already in favorite list."
}

//
//  PersistenceManager.swift
//  GitFollowers
//
//  Created by Hoang on 25.5.2020.
//  Copyright © 2020 Hoang. All rights reserved.
//

import Foundation


enum PersistenceActionType {
    case add, remove
}


enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    
    static func updateWith(favorite: Follower, actionType: PersistenceActionType, completionHandler: @escaping (GFError?) -> Void) {
        
        retrieveFavorites { (result) in
            switch result {
            case .success(var favorites):
                
                switch actionType {
                case .add:
                    guard !favorites.contains(favorite) else {
                        completionHandler(.alreadyInFavorite)
                        return
                    }
                    favorites.append(favorite)
                    
                case .remove:
                    favorites.removeAll { $0.login == favorite.login }
                }
                
                completionHandler(saveFavorites(favorites: favorites))
                
            case .failure(let error):
                completionHandler(error)
            }
        }
    }
    
    
    static func retrieveFavorites(completionHandler: @escaping (Result<[Follower], GFError>) -> Void) {
        guard let favoritesData = UserDefaults.standard.object(forKey: Keys.favorites) as? Data else {
            completionHandler(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completionHandler(.success(favorites))
        }
        catch {
            completionHandler(.failure(.unableToFavorite))
        }
    }
    
    
    static func saveFavorites(favorites: [Follower]) -> GFError? {
        
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            UserDefaults.standard.set(encodedFavorites, forKey: Keys.favorites)
            return nil
        }
        catch {
            return .unableToFavorite
        }
    }
}

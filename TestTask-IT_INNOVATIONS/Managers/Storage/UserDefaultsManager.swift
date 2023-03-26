//
//  UserDefaultsManager.swift
//  TestTask-IT_INNOVATIONS
//
//  Created by  Sasha Khomenko on 25.03.2023.
//

import Foundation

final class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    let defaults = UserDefaults.standard
    
    private enum DefaultKeys: String {
        case favorite
    }
    
    var favorites: [Favorite]?{
        get {
            if let data = defaults.object(forKey: DefaultKeys.favorite.rawValue) as? Data,
               let players = try? PropertyListDecoder().decode(Array<Favorite>.self, from: data) {
                return players
            }
            return []
        } set {
            guard let value = newValue else {return}
            defaults.set(try? PropertyListEncoder().encode(value), forKey: DefaultKeys.favorite.rawValue)
        }
    }
    
    func addPlayerToFavorites(player: Player, comment: String?) {
        guard var array = favorites else {return}
        let favorite = Favorite(player: player, comment: comment)
        array.append(favorite)
        favorites = array
    }
    
    func updateComment(player: Player, comment: String) {
        guard var array = favorites else {return}
        if let index = array.firstIndex(where: { $0.player.player.id == player.player.id }) {
            array[index].comment = comment
            favorites = array
        }
    }
    
    func isFavoritePlayer(_ player: Player) -> Bool {
        guard let favoritesArray = favorites else { return false }
        for favorite in favoritesArray {
            if favorite.player.player.id == player.player.id {
                return true
            }
        }
        return false
    }
    
    func removePlayerFromFavorites(_ player: Player) {
        guard var favoriteArray = favorites else {return}
        var index = Int()
        for (i,favorite) in favoriteArray.enumerated() {
            if favorite.player.player.id == player.player.id {
                index = i
            }
        }
        favoriteArray.remove(at: index)
        favorites = favoriteArray
    }
    
    func fetchFavoritePlayers() -> [Favorite] {
        guard let favorites = favorites else {return []}
        return favorites
    }
}

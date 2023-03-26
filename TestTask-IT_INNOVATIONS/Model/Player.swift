//
//  Player.swift
//  TestTask-IT_INNOVATIONS
//
//  Created by  Sasha Khomenko on 24.03.2023.
//

import Foundation

struct Favorite: Codable {
    let player: Player
    var comment: String?
}

struct Player: Decodable, Encodable {
    let player: InfoPlayer
}

struct InfoPlayer: Decodable, Encodable {
    let id: String
    let meta: Meta
    let avatar: String?
    let username: String?
}

struct Meta: Decodable, Encodable {
    let profileurl: String
}

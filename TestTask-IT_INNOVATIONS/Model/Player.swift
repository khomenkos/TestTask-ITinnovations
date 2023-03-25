//
//  Player.swift
//  TestTask-IT_INNOVATIONS
//
//  Created by  Sasha Khomenko on 24.03.2023.
//

import Foundation

struct Player: Decodable {
    let player: InfoPlayer
}

struct InfoPlayer: Decodable {
    let avatar: String?
    let username: String?
}

//
//  Route.swift
//  TestTask-IT_INNOVATIONS
//
//  Created by  Sasha Khomenko on 25.03.2023.
//

import Foundation

enum Route {
    static let baseUrl = "https://playerdb.co/api/player/steam/"
    //static let baseUrl = "https://yummie.glitch.me"
    
    case fetchUser(String)
    
    var discription: String {
        switch self {
        case .fetchUser(let username):
            return "\(username)"
        }
        //case .fetchUser(let username): return "/dishes/\(username)"
    }
}



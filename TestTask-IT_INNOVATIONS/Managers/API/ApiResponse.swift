//
//  ApiResponse.swift
//  TestTask-IT_INNOVATIONS
//
//  Created by  Sasha Khomenko on 25.03.2023.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let message: String?
    let data: T?
    let error: String?
}

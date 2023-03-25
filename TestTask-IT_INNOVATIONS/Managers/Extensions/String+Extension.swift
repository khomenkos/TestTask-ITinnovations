//
//  String+Extension.swift
//  TestTask-IT_INNOVATIONS
//
//  Created by  Sasha Khomenko on 25.03.2023.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}

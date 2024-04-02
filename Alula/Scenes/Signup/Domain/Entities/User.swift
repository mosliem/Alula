//
//  User.swift
//  Alula
//
//  Created by mohamed sliem on 20/03/2024.
//

import Foundation

struct User: Codable {
    var id: Int
    var name: String
    var email: String
    var password: String
    var avatar: String
    var role: String
}

//
//  UserDto.swift
//  Alula
//
//  Created by mohamed sliem on 26/03/2024.
//

import Foundation

struct UserSignupDto: Codable {
    var id: Int
    var name: String
    var email: String
    var password: String
    var avatar: String?
    var role: String?

    var creationAt: String?
    var updatedAt: String?
}

extension UserSignupDto {
    func toViewModel() -> User {
        return .init(
            id: id,
            name: name,
            email: email,
            password: password,
            avatar: avatar ?? "",
            role: role ?? "customer"
        )
    }
}

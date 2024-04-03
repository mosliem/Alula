//
//  LoginRepositoryProtocol.swift
//  Alula
//
//  Created by mohamed sliem on 27/03/2024.
//

import Utilits

protocol LoginRepositoryProtocol {
    func login(endpoint: Requsetable, body: [String: String]) async throws -> TokenDto
}

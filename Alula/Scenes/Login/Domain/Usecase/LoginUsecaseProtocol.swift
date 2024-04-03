//
//  LoginUsecaseProtocol.swift
//  Alula
//
//  Created by mohamed sliem on 27/03/2024.
//

import Foundation

protocol LoginUsecaseProtocol {
    func execute(loginData: LoginData) async throws -> Token
}

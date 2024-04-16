//
//  LoginUsecase.swift
//  Alula
//
//  Created by mohamed sliem on 27/03/2024.
//

import Foundation

class LoginUsecase: LoginUsecaseProtocol {

    private let repository: LoginRepositoryProtocol

    init(repository: LoginRepositoryProtocol) {
        self.repository = repository
    }

    func execute(loginData: LoginData) async throws -> Token {
        let endpoint = LoginAPIEndpoint.loginEndpoint()
        let body = loginData.loginDic
        return try await repository.login(endpoint: endpoint, body: body).toViewModel()
    }

}

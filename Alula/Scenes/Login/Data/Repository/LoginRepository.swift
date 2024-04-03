//
//  LoginRepository.swift
//  Alula
//
//  Created by mohamed sliem on 27/03/2024.
//

import Utilits

class LoginRepository: LoginRepositoryProtocol {
    func login(endpoint: Requsetable, body: [String : String]) async throws -> TokenDto {
        
        return try await NetworkService.shared.request(
            endpoint: endpoint,
            model: TokenDto.self,
            body: body
        )
        
    }
}


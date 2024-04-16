//
//  SignupRepository.swift
//  Alula
//
//  Created by mohamed sliem on 20/03/2024.
//

import Foundation
import Combine
import Utilits

class SignupRepository: SignupRepositoryProtocol {

    func signup(endpoint: Requsetable, signupBody: [String: String]) -> AnyPublisher<UserSignupDto, APIError> {
        return NetworkManager.shared.executeRequest(
            with: endpoint,
            model: UserSignupDto.self,
            body: signupBody
        )
    }

}

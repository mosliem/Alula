//
//  SignupRepositoryProtocol.swift
//  Alula
//
//  Created by mohamed sliem on 26/03/2024.
//

import Foundation
import Utilits
import Combine

protocol SignupRepositoryProtocol {
    func signup(
        endpoint: Requsetable,
        signupBody: [String: String]
    ) -> AnyPublisher<UserSignupDto, APIError>
}

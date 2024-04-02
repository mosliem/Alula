//
//  SignupUsecaseProtocol.swift
//  Alula
//
//  Created by mohamed sliem on 26/03/2024.
//

import Foundation
import Combine
import Utilits

protocol SignupUsecaseProtocol {
    func execute(
        signupData: SignupData
    ) -> AnyPublisher <UserSignupDto, APIError>
}

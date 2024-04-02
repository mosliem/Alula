//
//  SignupUseCase.swift
//  Alula
//
//  Created by mohamed sliem on 20/03/2024.
//

import Foundation
import Combine
import Utilits

class SignupUsecase: SignupUsecaseProtocol {
    
    private let repository: SignupRepositoryProtocol
    
    init(repository: SignupRepositoryProtocol){
        self.repository = repository
    }
    
    func execute(
        signupData: SignupData
    ) -> AnyPublisher <UserSignupDto, APIError> {
        
        let endpoint = SignupAPIEndpoint.signup()
        let signupBody = signupData.signupDic
        return repository.signup(endpoint: endpoint, signupBody: signupBody)
    }
    
}

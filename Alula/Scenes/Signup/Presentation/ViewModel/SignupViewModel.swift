//
//  SignupViewModel.swift
//  Alula
//
//  Created by mohamed sliem on 26/03/2024.
//

import Foundation

class SignupViewModel: SignupViewModelProtocol {
    
    var signupState: Observable<String> = Observable("")
    
    private var signupUsecase: SignupUsecaseProtocol
    private var signupCoordinator: SignupCoordinatorProtocol
    
    init(signupUsecase: SignupUsecaseProtocol, coordinator: SignupCoordinatorProtocol) {
        self.signupUsecase = signupUsecase
        self.signupCoordinator = coordinator
    }
    
    func viewDidLoad() {
        signup()
    }
    
    func loginPressed() {
        signupCoordinator.login()
    }
    
    private func signup(){
        signupUsecase.execute(
            signupData:
                SignupData(
                    name: "Sliem",
                    email: "mohamedsliem@gmail.com",
                    password: "mohamed011",
                    avatar: "https://picsum.photos/800",
                    role: "customer"
                )
        )
        .receive(on: DispatchQueue.main)
        .sink {[weak self] completion in
        
            switch completion {
            case .finished:
                break
            case.failure(let error):
                self?.signupState.value = error.description
            }
        } receiveValue: { user in
            print(user.toViewModel())
            self.signupState.value = "Sign up success!\(user)"
        }
        .cancel()

    }
    
}

//
//  LoginViewModel.swift
//  Alula
//
//  Created by mohamed sliem on 27/03/2024.
//

import Foundation

class LoginViewModel: LoginViewModelProtocol {
    
    private var coordinator: LoginCoordinatorProtocol
    private var usecase: LoginUsecaseProtocol
    
    init(coordinator: LoginCoordinatorProtocol, usecase: LoginUsecaseProtocol) {
        self.coordinator = coordinator
        self.usecase = usecase
    }
    
    func viewDidLoad() {}
    
    func loginPressed(){
        Task{
            await login()
        }
    }
    
    @MainActor
    private func login() async{
        do{
          let token = try await usecase.execute(
                loginData:
                    LoginData(
                        email: "mohamedsliem@gmail.com",
                        password: "mohamed011"
                    )
            )
            print(token)
        }
        catch{
            print(error)
        }
    }
    
    func newUserPressed(){
        coordinator.signup()
    }
    
}

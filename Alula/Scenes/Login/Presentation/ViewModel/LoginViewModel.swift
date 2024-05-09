//
//  LoginViewModel.swift
//  Alula
//
//  Created by mohamed sliem on 27/03/2024.
//

import Foundation

class LoginViewModel: LoginViewModelProtocol {
    
    private var coordinator: LoginCoordinatorProtocol?
    private var usecase: LoginUsecaseProtocol
    private var token: Token?
    
    @Email private var emailEntry: String = ""
    @Password private var passwordEntry: String = ""
    
    init(coordinator: LoginCoordinatorProtocol?, usecase: LoginUsecaseProtocol) {
        self.coordinator = coordinator
        self.usecase = usecase
    }

    func viewDidLoad() {}

    func loginPressed() {
      validateEmailPasswordEntry()
    }

    @MainActor
    func login() async {
        do {
          let token = try await usecase.execute(
                loginData:
                    LoginData(
                        email: "mohamedsliem@gmail.com",
                        password: "mohamed011"
                    )
            )
            setToken(token: token)
            coordinator?.home()
        } catch {
            print(error)
        }
    }

    func newUserPressed() {
        coordinator?.signup()
    }

    private func setToken(token: Token){
        self.token = token
    }
    
    func getCurrentToken() -> Token? {
        return token
    }
    
    
    func didUpdateEmail(with email: String) {
        _emailEntry.wrappedValue = email
    }
    
    func didUpdatePassword(with password: String) {
        _passwordEntry.wrappedValue = password
    }
    
    private func validateEmailPasswordEntry(){
        print("valid")
        print(_passwordEntry.projectedValue)
        if _emailEntry.projectedValue && _passwordEntry.projectedValue {
            print("Valid Entry")
            Task {
                await login()
            }
        } else {
            
            let action = AlertActionModel(
                title: "Ok",
                style: .default,
                handler: nil
            )
            coordinator?.alert(
                with: "Error",
                alertMessage: "Enter valid email and password",
                alertActions: [action]
            )
        }
        
    }
}

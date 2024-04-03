//
//  LoginCoordinator.swift
//  Alula
//
//  Created by mohamed sliem on 27/03/2024.
//

import UIKit

protocol LoginCoordinatorProtocol {
    func signup()
}

class LoginCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var parent: AuthCoordinator
    
    init(navigationController: UINavigationController, parent: AuthCoordinator) {
        self.navigationController = navigationController
        self.parent = parent
    }
    
    func start(animated: Bool) {
        let repository = LoginRepository()
        let usecase = LoginUsecase(repository: repository)
        let viewModel = LoginViewModel(coordinator: self, usecase: usecase)
        let vc = LoginViewController()
        vc.viewModel = viewModel
        
        navigationController.pushViewController(vc, animated: true)
    }
    
}

extension LoginCoordinator: LoginCoordinatorProtocol {
    func signup() {
        parent.signup()
    }
}

//
//  LoginCoordinator.swift
//  Alula
//
//  Created by mohamed sliem on 27/03/2024.
//

import UIKit

protocol LoginCoordinatorProtocol {
    func signup()
    func home()
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
        let viewController = LoginViewController()
        viewController.viewModel = viewModel

        navigationController.pushViewController(viewController, animated: true)
    }

}

extension LoginCoordinator: LoginCoordinatorProtocol {
    func signup() {
        parent.signup()
    }

    func home() {
        parent.home()
    }
}

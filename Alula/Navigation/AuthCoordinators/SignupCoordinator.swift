//
//  LoginCoordinator.swift
//  Alula
//
//  Created by mohamed sliem on 27/03/2024.
//

import UIKit

protocol SignupCoordinatorProtocol {
    func login()
}

class SignupCoordinator: Coordinator {

    var navigationController: UINavigationController
    var parent: AuthCoordinator

    init(navigationController: UINavigationController, parent: AuthCoordinator) {
        self.navigationController = navigationController
        self.parent = parent
    }

    func start(animated: Bool) {
        let viewController = SignupViewController()

        let repository = SignupRepository()
        let usecase = SignupUsecase(repository: repository)
        let viewModel = SignupViewModel(signupUsecase: usecase, coordinator: self)
        viewController.viewModel = viewModel

        navigationController.pushViewController(viewController, animated: true)
    }

}

extension SignupCoordinator: SignupCoordinatorProtocol {
    func login() {
        parent.login()
    }
}

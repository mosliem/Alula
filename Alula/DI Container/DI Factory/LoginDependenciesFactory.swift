//
//  LoginDependenciesFactory.swift
//  Alula
//
//  Created by mohamed sliem on 17/04/2024.
//

import UIKit

class LoginDependenciesFactory: DependenciesFactory {
    func create(with coordinator: Coordinator) -> UIViewController {
        let repository = LoginRepository()
        let usecase = LoginUsecase(repository: repository)
        let viewModel = LoginViewModel(
            coordinator: coordinator as? LoginCoordinatorProtocol,
            usecase: usecase
        )
        let viewController = LoginViewController()
        viewController.viewModel = viewModel
        return viewController
    }
}

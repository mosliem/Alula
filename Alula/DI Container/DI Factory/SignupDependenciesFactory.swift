//
//  SignupDependenciesFactory.swift
//  Alula
//
//  Created by mohamed sliem on 17/04/2024.
//

import Foundation
import UIKit

class SignupDependenciesFactory: DependenciesFactory {

    func create(with coordinator: Coordinator) -> UIViewController {
        let viewController = SignupViewController()

        let repository = SignupRepository()
        let usecase = SignupUsecase(repository: repository)
        let viewModel = SignupViewModel(
            signupUsecase: usecase,
            coordinator: coordinator as? SignupCoordinatorProtocol
        )
        viewController.viewModel = viewModel

        return viewController
    }
}

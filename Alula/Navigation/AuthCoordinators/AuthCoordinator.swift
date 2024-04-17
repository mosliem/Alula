//
//  AuthCoordinator.swift
//  Alula
//
//  Created by mohamed sliem on 27/03/2024.
//

import UIKit

class AuthCoordinator: Coordinator, ParentCoordinator {
    var diContainter: FactoryProtocol
    var parentCoordinator: RootCoordinator?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    init(
        DIContainter: FactoryProtocol,
        parentCoordinator: RootCoordinator? = nil,
        navigationController: UINavigationController
    ) {
        self.diContainter = DIContainter
        self.parentCoordinator = parentCoordinator
        self.navigationController = navigationController
    }

    func start(animated: Bool) {
        signup()
    }
}

extension AuthCoordinator {
    func login() {
        let loginCoordinator = LoginCoordinator(
            DIContainter: diContainter,
            navigationController: navigationController,
            parent: self
        )
        childCoordinators.append(loginCoordinator)
        loginCoordinator.start(animated: true)
    }

    func signup() {
        let signupCoordinator = SignupCoordinator(
            DIContainter: diContainter,
            navigationController: navigationController,
            parent: self
        )
        childCoordinators.append(signupCoordinator)
        signupCoordinator.start(animated: true)
    }

    func home() {
        let homeCoordinator = HomeCoordinator(
            DIContainter: diContainter,
            navigationController: navigationController,
            parent: self
        )
        childCoordinators.append(homeCoordinator)
        homeCoordinator.start(animated: true)
    }
}

//
//  AuthCoordinator.swift
//  Alula
//
//  Created by mohamed sliem on 27/03/2024.
//

import UIKit

class AuthCoordinator: Coordinator, ParentCoordinator{
    
    var parentCoordinator: RootCoordinator?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        signup()
    }
}

extension AuthCoordinator {
    func login() {
        let loginCoordinator = LoginCoordinator(
            navigationController: navigationController,
            parent: self
        )
        
        childCoordinators.append(loginCoordinator)
        loginCoordinator.start(animated: true)
    }
    
    func signup(){
        
        let signupCoordinator = SignupCoordinator(
            navigationController: navigationController,
            parent: self
        )
        
        childCoordinators.append(signupCoordinator)
        signupCoordinator.start(animated: true)
    }
    
    func home(){
        let homeCoordinator = HomeCoordinator(
            navigationController: navigationController,
            parent: self
        )
        childCoordinators.append(homeCoordinator)
        homeCoordinator.start(animated: true)
    }
}

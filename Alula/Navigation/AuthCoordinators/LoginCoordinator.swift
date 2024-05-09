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
    func alert(with alertTitle: String, alertMessage: String, alertActions: [AlertActionModel] )

}

class LoginCoordinator: Coordinator {
    var diContainter: FactoryProtocol
    var navigationController: UINavigationController
    var parent: AuthCoordinator

    init(
        DIContainter: FactoryProtocol,
        navigationController: UINavigationController,
        parent: AuthCoordinator
    ) {
        self.diContainter = DIContainter
        self.navigationController = navigationController
        self.parent = parent
    }

    func start(animated: Bool) {
        let viewController = diContainter.createVC(for: .login, with: self)
        navigationController.pushViewController(viewController, animated: true)
    }

}

extension LoginCoordinator: LoginCoordinatorProtocol {
    
    func alert(with alertTitle: String, alertMessage: String, alertActions: [AlertActionModel]) {
        
        let alert = UIAlertController(
            title: alertTitle,
            message: alertMessage,
            preferredStyle: .alert
        )
        
        for alertAction in alertActions {
            let action = UIAlertAction(
                title: alertAction.title,
                style: alertAction.style,
                handler: alertAction.handler
            )
            
            alert.addAction(action)
        }
        
        navigationController.present(alert, animated: true)
    }
    
    func signup() {
        parent.signup()
    }

    func home() {
        parent.home()
    }
}

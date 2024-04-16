//
//  DIContainer.swift
//  Alula
//
//  Created by mohamed sliem on 16/04/2024.
//

import UIKit

class DIContainer: FactoryProtocol {
    
    lazy var loginFactory = LoginDependenciesFactory()
    lazy var signupFactory = SignupDependenciesFactory()
    lazy var homeFactory = HomeDependenciesFactory()
    
    func createVC(for scene: SceneType, with coordinator: Coordinator) -> UIViewController {
        switch scene {
        case .home:
            homeFactory.create(with: coordinator)
        case .login:
            loginFactory.create(with: coordinator )
        case .signup:
            signupFactory.create(with: coordinator)
        }
    }
    
}

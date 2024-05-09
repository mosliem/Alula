//
//  LoginCoordinatorStub.swift
//  AlulaTests
//
//  Created by mohamed sliem on 08/05/2024.
//

import Foundation
import UIKit
@testable import Alula


class LoginCoordinatorStub: Coordinator, LoginCoordinatorProtocol {

  
    var navigationController: UINavigationController = UINavigationController()
    
    var diContainter: FactoryProtocol = LoginFactoryStub()
    
    func start(animated: Bool) {}
    
    func signup() {
        let factory = SignupFactoryStub()
        let vc = factory.createVC(for: .signup, with: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func home() {
        let factory = HomeFactoryStub()
        let vc = factory.createVC(for: .home, with: self)
        navigationController.pushViewController(vc, animated: true)

    }
    
    func alert(with alertTitle: String, alertMessage: String, alertActions: [Alula.AlertActionModel]) {}
    
    
}

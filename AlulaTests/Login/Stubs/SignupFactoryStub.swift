//
//  LoginFactoryStub.swift
//  AlulaTests
//
//  Created by mohamed sliem on 08/05/2024.
//

import Foundation
@testable import Alula
import UIKit

class SignupFactoryStub: FactoryProtocol {
    func createVC(for scene: SceneType, with coordinator: Coordinator) -> UIViewController {
        let viewModel = SignUpViewModelStub()
        let vc = SignupViewController()
        vc.viewModel = viewModel
        return vc
    }
}

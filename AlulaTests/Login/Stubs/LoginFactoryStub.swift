//
//  LoginFactoryStub.swift
//  AlulaTests
//
//  Created by mohamed sliem on 08/05/2024.
//

import Foundation
@testable import Alula
import UIKit

class LoginFactoryStub: FactoryProtocol {
    func createVC(for scene: Alula.SceneType, with coordinator: Coordinator) -> UIViewController {
        return UIViewController()
    }
}

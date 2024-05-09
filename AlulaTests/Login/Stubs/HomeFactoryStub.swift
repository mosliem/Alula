//
//  HomeFactoryStub.swift
//  AlulaTests
//
//  Created by mohamed sliem on 08/05/2024.
//

import Foundation
import UIKit

@testable import Alula

class HomeFactoryStub: FactoryProtocol {
    func createVC(for scene: SceneType, with coordinator: Coordinator) -> UIViewController {
        
        let viewModel = HomeViewModelStub()
        let vc = HomeViewController()
        vc.viewModel = viewModel
        
        return vc
    }
    
    
}

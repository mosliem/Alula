//
//  RootCoordinator.swift
//  Alula
//
//  Created by mohamed sliem on 27/03/2024.
//

import UIKit

class RootCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start(animated: Bool) {
       let authCoordinator = AuthCoordinator(navigationController: navigationController)
        authCoordinator.start(animated: true)
    }
}

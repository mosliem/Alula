//
//  HomeCoordinator.swift
//  Alula
//
//  Created by mohamed sliem on 03/04/2024.
//

import UIKit

protocol HomeCoordinatorProtocol {}

class HomeCoordinator: Coordinator {
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
        let viewController = diContainter.createVC(for: .home, with: self)
        navigationController.pushViewController(viewController, animated: true)
    }

}

extension HomeCoordinator: HomeCoordinatorProtocol {}

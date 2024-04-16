//
//  HomeCoordinator.swift
//  Alula
//
//  Created by mohamed sliem on 03/04/2024.
//

import UIKit

protocol HomeCoordinatorProtocol {}

class HomeCoordinator: Coordinator {

    var navigationController: UINavigationController
    var parent: AuthCoordinator

    init(navigationController: UINavigationController, parent: AuthCoordinator) {
        self.navigationController = navigationController
        self.parent = parent
    }

    func start(animated: Bool) {
        let remoteRepo = HomeRemoteRepository()
        let localRepo = HomeLocalRepository()

        let repository = HomeRepository(remoteRepository: remoteRepo, localRepository: localRepo)
        let usecase = FetchProductsUsecase(homeRepo: repository)
        let viewModel = HomeViewModel(usecase: usecase, coordinator: self)
        let viewController = HomeViewController()
        viewController.viewModel = viewModel

        navigationController.pushViewController(viewController, animated: true)
    }

}

extension HomeCoordinator: HomeCoordinatorProtocol {}

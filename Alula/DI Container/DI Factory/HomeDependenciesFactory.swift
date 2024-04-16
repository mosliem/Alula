//
//  HomeDependenciesFactory.swift
//  Alula
//
//  Created by mohamed sliem on 17/04/2024.
//

import Foundation
import UIKit

class HomeDependenciesFactory: DependenciesFactory {
    func create(with coordinator: Coordinator) -> UIViewController {
        let remoteRepo = HomeRemoteRepository()
        let localRepo = HomeLocalRepository()

        let repository = HomeRepository(
            remoteRepository: remoteRepo,
            localRepository: localRepo
        )
        let usecase = FetchProductsUsecase(
            homeRepository: repository,
            adapter: ProductsAdapter()
        )

        let viewModel = HomeViewModel(
            usecase: usecase,
            coordinator: coordinator as? HomeCoordinatorProtocol
        )
        let viewController = HomeViewController()
        viewController.viewModel = viewModel

        return viewController
    }
}

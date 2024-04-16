//
//  HomeViewMode.swift
//  Alula
//
//  Created by mohamed sliem on 03/04/2024.
//

import Foundation

class HomeViewModel: HomeViewModelProtocol {

    private var usecase: FetchProductsUsecaseProtocol
    private var coordinator: HomeCoordinatorProtocol?

    init(usecase: FetchProductsUsecaseProtocol, coordinator: HomeCoordinatorProtocol?) {
        self.usecase = usecase
        self.coordinator = coordinator
    }

    func viewDidLoad() {
        usecase.fetchProducts()
    }

}

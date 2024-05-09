//
//  getProductsUsecase.swift
//  Alula
//
//  Created by mohamed sliem on 03/04/2024.
//

import Foundation

class FetchProductsUsecase: FetchProductsUsecaseProtocol {
    
    var products: [ProductEntity]?
    
    let homeRepository: HomeRepositoryProtocol
    let adapter: ProductsAdapterProtocol
    
    init(homeRepository: HomeRepositoryProtocol, adapter: ProductsAdapterProtocol) {
        self.homeRepository = homeRepository
        self.adapter = adapter
    }

    func fetchProducts(
        taskCompletion: @escaping (Result<Bool,Error>) -> Void,
        recievedValue: @escaping ([ProductEntity]) -> Void
    ) {
        
        let endpoint = HomeAPIEndpoint.homeEndpoint()
        homeRepository.getProducts(endpoint: endpoint)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case.failure(let error):
                    taskCompletion(.failure(error))
                }
            } receiveValue: { [weak self] products in
                guard let products = self?.adapter.adapt(products: products) else {return}
                self?.products = products
                recievedValue(products)
                self?.homeRepository.cacheProducts(products: products)
            }
            .cancel()
    }
}

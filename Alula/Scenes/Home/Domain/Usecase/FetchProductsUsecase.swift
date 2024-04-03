//
//  getProductsUsecase.swift
//  Alula
//
//  Created by mohamed sliem on 03/04/2024.
//

import Foundation

class FetchProductsUsecase: FetchProductsUsecaseProtocol {
    
    let homeRepository: HomeRepositoryProtocol

    init(homeRepo: HomeRepositoryProtocol) {
        self.homeRepository = homeRepo
    }
    
    func fetchProducts() {
        
        let endpoint = HomeAPIEndpoint.HomeEndpoint()
        
        homeRepository.getProducts(endpoint: endpoint)
            .sink { completion in
            
                switch completion {
                case .finished:
                    break
                case.failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] products in
                let products = products.toDomain()
                print(products)
                self?.homeRepository.cacheProducts(products: products)
            }
            .cancel()
    }
    
    
}

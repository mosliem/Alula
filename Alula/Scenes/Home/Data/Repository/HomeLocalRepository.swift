//
//  HomeLocalRepository.swift
//  Alula
//
//  Created by mohamed sliem on 03/04/2024.
//

import Foundation

protocol HomeLocalRepositoryProtocol {
    func cacheProducts(products: [ProductEntity]) throws
}

class HomeLocalRepository: HomeLocalRepositoryProtocol {
    var storage: CoredataWrapperProtocol?
    
    init(storage: CoredataWrapperProtocol? = CoredataWrapper() ) {
        self.storage = storage
    }
    
    func cacheProducts(products: [ProductEntity]) throws {
        for product in products {
      
                try storage?.createProduct(storedProduct: product)
//                try CoredataStorage.shared.createProduct(storedProduct: product)
           
        }
    }
}

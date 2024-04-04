//
//  HomeLocalRepository.swift
//  Alula
//
//  Created by mohamed sliem on 03/04/2024.
//

import Foundation

protocol HomeLocalRepositoryProtocol {
    func cacheProducts(products: [ProductEntity])
}
class HomeLocalRepository: HomeLocalRepositoryProtocol {
    func cacheProducts(products: [ProductEntity]) {
        for product in products {
            CoredataStorage.shared.createProduct(storedProduct: product)
        }
    }
}

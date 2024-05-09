//
//  CoredataWrapper.swift
//  Alula
//
//  Created by mohamed sliem on 09/05/2024.
//

import Foundation

protocol CoredataWrapperProtocol {
    func createProduct(storedProduct: ProductEntity) throws
    func createCategory(storedCategory: CategoryEntity)
}

class CoredataWrapper: CoredataWrapperProtocol {
    
    func createProduct(storedProduct: ProductEntity) throws {
        try CoredataStorage.shared.createProduct(storedProduct: storedProduct)
    }
    
    func createCategory(storedCategory: CategoryEntity) {
        CoredataStorage.shared.createCategory(storedCategory: storedCategory)
    }
    
    
}

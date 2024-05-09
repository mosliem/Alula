//
//  GetProductsCoredataStub.swift
//  AlulaTests
//
//  Created by mohamed sliem on 09/05/2024.
//

import CoreData
@testable import Alula


enum CoredataError: Error {
    case SavingFailed
}

class GetProductsCoredataStub: CoredataWrapperProtocol {

    func createProduct(storedProduct: ProductEntity) throws {
        if storedProduct.price < 0 {
            try failedSaveProducts()
        }
    }
    
    func createCategory(storedCategory: CategoryEntity) {
        let category = Category()
        category.id = Int32(storedCategory.id)
        category.name = storedCategory.name
    }
    
    
    init(){}
    
    func sucessSaveProducts() throws {
        save()
    }
    
    func failedSaveProducts() throws{
        throw(CoredataError.SavingFailed)
    }
    
    func save(){
        print("Saved to CoreDats")
    }
}


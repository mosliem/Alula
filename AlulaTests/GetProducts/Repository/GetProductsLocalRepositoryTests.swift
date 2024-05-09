//
//  GetProductsLocalRepositoryTests.swift
//  AlulaTests
//
//  Created by mohamed sliem on 09/05/2024.
//

import XCTest
@testable import Alula

final class GetProductsLocalRepositoryTests: XCTestCase {
    
    var coredata: CoredataWrapperProtocol!
    var repository: HomeLocalRepositoryProtocol!
    
    override func setUp() {
        coredata = GetProductsCoredataStub()
        repository = HomeLocalRepository(storage: coredata)
    }
    
    override func tearDown() {
        coredata = nil
        repository = nil
    }
    
    func testSuccessSaveCoreData(){
        let product = ProductEntity(
            id: 1,
            title: "ball",
            price: 10,
            description: "",
            category: CategoryEntity(
                id: 10,
                name: "",
                image: URL(
                    string: "https://i.imgur.com/eGOUveI.jpeg"
                )!
            ),
            images: []
        )
        
        XCTAssertNoThrow(
            try? repository.cacheProducts(
                products: [product]
            )
        )
    }
    
    func testFailedSaveCoreData(){
        let product = ProductEntity(
            id: 1,
            title: "ball",
            price: -20,
            description: "",
            category: CategoryEntity(
                id: 10,
                name: "",
                image: URL(
                    string: "https://i.imgur.com/eGOUveI.jpeg"
                )!
            ),
            images: []
        )
        
        XCTAssertThrowsError(
            try repository.cacheProducts(
                products: [product]
            )) { error in
                XCTAssertTrue( error is CoredataError)
            }

    }

}

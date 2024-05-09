//
//  GetProductsUsecaseTests.swift
//  AlulaTests
//
//  Created by mohamed sliem on 09/05/2024.
//

import XCTest
@testable import Alula


final class GetProductsUsecaseTests: XCTestCase {
    
    var usecase: FetchProductsUsecaseProtocol!
    var adpater: ProductsAdapterProtocol!
    var localRepository: HomeLocalRepositoryProtocol!
    var remoteRepository: HomeRemoteRepositoryProtocol!
    var repository: HomeRepositoryProtocol!
    var network: GetProductsNetworkStub!
    
    override func setUp() {
        
        localRepository = HomeLocalRepository()
        remoteRepository = HomeRemoteRepository()
        repository = HomeRepository(
            remoteRepository: remoteRepository,
            localRepository: localRepository
        )
        adpater = ProductsAdapter()
        usecase = FetchProductsUsecase(
            homeRepository: repository,
            adapter: adpater
        )
        
        network = GetProductsNetworkStub()
    }
    
    override func tearDown() {
        localRepository = nil
        repository = nil
        remoteRepository = nil
        adpater = nil
        network = nil
        usecase = nil
    }
    
    func testSuccessFetchProducts(){
        
        network.getProductsSuccessRequestStub()
        
        let expection = expectation(description: "NetworkError")
        var expectedValue: [ProductEntity]?
        
        usecase.fetchProducts(taskCompletion: { completion in
            switch completion {
            case .success:
                break
            case .failure(let error):
                XCTAssertNotNil(error)
            }
        }, recievedValue: { products in
            expectedValue = products
            expection.fulfill()
        })
        
        wait(for: [expection], timeout: 5)
        XCTAssertNotNil(expectedValue)
    }
    
    func testFailedFetchProducts(){
        
        network.getProductsFailedRequestStub()
        
        let expection = expectation(description: "NetworkError")
        var expectedValue: [ProductEntity]?

        usecase.fetchProducts(
            taskCompletion: { completion in
                switch completion {
                case .success:
                    break
                case .failure(let error):
                    expection.fulfill()
                }
            },
            recievedValue: { products in
                expectedValue = products
                XCTFail("Should not load products")
            })
        

        wait(for: [expection], timeout: 5)
        XCTAssertNil(expectedValue)
    }
}



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
    
    func testSuccessFetchProducts(){
        
        network.getProductsSuccessRequestStub()
        
        let expection = expectation(description: "NetworkError")
        
        usecase.fetchProducts()
        expection.fulfill()
        
        wait(for: [expection], timeout: 5)
        XCTAssertNotNil(usecase.products)
    }
    
    func testFailedFetchProducts(){
        
        network.getProductsFailedRequestStub()
        
        let expection = expectation(description: "NetworkError")
        
        usecase.fetchProducts()
        expection.fulfill()
        
        wait(for: [expection], timeout: 5)
        XCTAssertNil(usecase.products)
    }
}



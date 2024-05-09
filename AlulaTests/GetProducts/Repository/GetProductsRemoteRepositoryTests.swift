//
//  GetProductsRepositoryTests.swift
//  AlulaTests
//
//  Created by mohamed sliem on 09/05/2024.
//

import XCTest
import Utilits
import OHHTTPStubs
import OHHTTPStubsSwift

@testable import Alula

final class GetProductsRemoteRepositoryTests: XCTestCase {
    
    var endpoint: Requsetable!
    var repository: HomeRemoteRepositoryProtocol!
    var networkStub: GetProductsNetworkStub!
    
    override func setUp() {
        endpoint = HomeAPIEndpoint.homeEndpoint()
        repository = HomeRemoteRepository()
        networkStub = GetProductsNetworkStub()
    }
    
    override func tearDown() {
        endpoint = nil
        repository = nil
        networkStub = nil
    }
    
    func testSuccessGetProducts(){
        networkStub.getProductsSuccessRequestStub()
        
        var expectedValue: [ProductDto]?
        let expection = expectation(description: "NetworkError")
        
        repository.getProducts(endpoint: endpoint)
            .sink { completion in
                switch completion {
                    
                case .finished:
                    break
                case .failure(let error):
                    XCTAssertNotNil(error)
                }
            } receiveValue: { products in
                
                XCTAssertNotNil(products)
                expectedValue = products
                expection.fulfill()
            }
            .cancel()
        
        wait(for: [expection], timeout: 5)
        XCTAssertNotNil(expectedValue)
    }
    
    func testFailedGetProducts(){
        networkStub.getProductsFailedRequestStub()
        
        let expection = expectation(description: "NetworkError")
        var expectedValue: [ProductDto]?
        
        repository.getProducts(endpoint: endpoint)
            .sink { completion in
                switch completion {
                    
                case .finished:
                    break
                case .failure(let error):
                    XCTAssertNotNil(error)
                    expection.fulfill()
                }
            } receiveValue: { products in
                XCTFail("Should not get products")
                XCTAssertNil(products)
                expectedValue = products
            }
            .cancel()
        
        wait(for: [expection], timeout: 5)
        XCTAssertNil(expectedValue)
    }
}

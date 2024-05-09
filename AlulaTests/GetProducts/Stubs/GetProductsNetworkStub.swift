//
//  GetProductsNetworkStub.swift
//  AlulaTests
//
//  Created by mohamed sliem on 09/05/2024.
//

import Foundation
import Utilits
import OHHTTPStubs
import OHHTTPStubsSwift

class GetProductsNetworkStub {
    
    init(){}
    
    func getProductsSuccessRequestStub() {
        let expectedURL = "/api/v1/products"
    
        stub(condition: isPath(expectedURL)) { _ in
            let responsePath = OHPathForFile("Products.json", type(of: self))!
            return fixture(filePath: responsePath, status: 200, headers: nil)
        }
    }
    
    func getProductsFailedRequestStub() {
        let expectedURL = "/api/v1/products"
        
        stub(condition: isPath(expectedURL)) { _ in
            let responsePath = OHPathForFile("InvalidProducts.json", type(of: self))!
            return fixture(filePath: responsePath, status: 403, headers: nil)
        }
    }
}

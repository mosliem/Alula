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
        let expectedURL = "https://api.escuelajs.co/api/v1/products"
    
        stub(condition: isAbsoluteURLString(expectedURL)) { _ in
            let responsePath = OHPathForFile("Products.json", type(of: self))!
            return fixture(filePath: responsePath, status: 200, headers: nil)
        }
    }
    
    func getProductsFailedRequestStub() {
        let expectedURL = "https://api.escuelajs.co/api/v1/products"
        
        stub(condition: isAbsoluteURLString(expectedURL)) { _ in
            let responsePath = OHPathForFile("InvalidProducts.json", type(of: self))!
            return fixture(filePath: responsePath, status: 403, headers: nil)
        }
    }
}

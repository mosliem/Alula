//
//  LoginNetworkServiceStub.swift
//  AlulaTests
//
//  Created by mohamed sliem on 06/05/2024.
//

import Foundation
import Utilits
import OHHTTPStubs
import OHHTTPStubsSwift
@testable import Alula

class LoginNetworkServiceStub {
    
    init(){}
    
    func loginSuccessRequestStub() {
        let expectedURL = "https://api.escuelajs.co/api/v1/auth/login"
        
        stub(condition: isAbsoluteURLString(expectedURL)) { _ in
            let responsePath = OHPathForFile("login.json", type(of: self))!
            return fixture(filePath: responsePath, status: 200, headers: nil)
        }
    }
    
    func loginFailedRequestStub(){
        let expectedURL = "https://api.escuelajs.co/api/v1/auth/login"
        
        stub(condition: isAbsoluteURLString(expectedURL)) { _ in
            let responsePath = OHPathForFile("loginInvalid.json", type(of: self))!
            return fixture(filePath: responsePath, status: 200, headers: nil)
        }
    }
}

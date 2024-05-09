//
//  LoginRepositoryTests.swift
//  AlulaTests
//
//  Created by mohamed sliem on 06/05/2024.
//

import XCTest
import OHHTTPStubs
import OHHTTPStubsSwift
@testable import Alula

final class LoginRepositoryTests: XCTestCase {
    
    var loginRepository: LoginRepositoryProtocol?
    let endpoint = LoginAPIEndpoint.loginEndpoint()
    var networkStub: LoginNetworkServiceStub?
    
    override func setUp() {
        super.setUp()
        loginRepository = LoginRepository()
        networkStub = LoginNetworkServiceStub()
    }
    
    override func tearDown() {
        loginRepository = nil
        networkStub = nil
    }
    
    func testRepositoryLoginSuccess() async throws{
        
        networkStub?.loginSuccessRequestStub()
        
        let token = TokenDto(
            accessToken: "dlfkajdfklj;akldjfka;jf3o23o4",
            refreshToken: "owerofkoqrfjopqjeo1231021e3"
        )
        
        var expectedResult: TokenDto?
        
        do {
            expectedResult = try await loginRepository?.login(
                endpoint: endpoint ,
                body: loginBodyObject
            )
            
        } catch {
            XCTAssertNotNil(error)
        }
        
        XCTAssertNotNil(expectedResult)
        XCTAssertEqual(token.accessToken, expectedResult?.accessToken)
        XCTAssertEqual(token.refreshToken, expectedResult?.refreshToken)
    }
    
    func testRepositoryLoginFailed() async throws {
        
        networkStub?.loginFailedRequestStub()
        
        var expectedResult: TokenDto?
        
        do {
            expectedResult = try await loginRepository?.login(
                endpoint: endpoint ,
                body: loginBodyObject
            )
            
            XCTFail("Should not get result")
            
        } catch {
            XCTAssertNotNil(error)
        }
        
        XCTAssertNil(expectedResult)
    }
    
}

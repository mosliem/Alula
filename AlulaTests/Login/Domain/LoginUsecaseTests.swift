//
//  LoginUsecase.swift
//  AlulaTests
//
//  Created by mohamed sliem on 08/05/2024.
//

import XCTest
import Utilits
@testable import Alula

final class LoginUsecaseTests: XCTestCase {

    var repository: LoginRepositoryProtocol!
    var endpoint: Requsetable?
    var usecase: LoginUsecaseProtocol!
    var networkStub: LoginNetworkServiceStub?
    var loginData: LoginData!
    
    override func setUp() {
        repository = LoginRepository()
        endpoint = LoginAPIEndpoint.loginEndpoint()
        usecase = LoginUsecase(repository: repository)
        networkStub = LoginNetworkServiceStub()
        
        loginData = LoginData(
            email: loginBodyObject["email"] ?? "nico@gmail.com",
            password: loginBodyObject["password"] ?? "1234"
        )
    }
    
    override func tearDown() {
        repository = nil
        endpoint = nil
        usecase = nil
        networkStub = nil
    }
    
    func testSuccessLoginUsecase() async throws {
        networkStub?.loginSuccessRequestStub()
        
        var expectedResult: Token?
        
        let exception = self.expectation(description: "Error with network")
        
        do {
            expectedResult = try await usecase.execute(loginData: loginData)
            exception.fulfill()
            
        } catch {
            XCTAssertNil(error)
        }
        
        await fulfillment(of: [exception], timeout: 2)

        XCTAssertNotNil(expectedResult)
        XCTAssertNotNil(expectedResult?.accessToken)
        XCTAssertNotNil(expectedResult?.refreshToken)

    }
    
    func testFailedLoginUsecase() async throws {
        
        networkStub?.loginFailedRequestStub()
        
        var expectedResult: Token?
        
        let exception = self.expectation(description: "Error with network")

        do {
            expectedResult = try await usecase.execute(loginData: loginData)
            XCTFail("Should not get result")
            
        } catch {
            XCTAssertNotNil(error)
            exception.fulfill()
        }
        
        await fulfillment(of: [exception], timeout: 2)
        XCTAssertNil(expectedResult)
    }
}

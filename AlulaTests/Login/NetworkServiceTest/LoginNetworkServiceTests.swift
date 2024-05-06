//
//  NetworkServiceTests.swift
//  AlulaTests
//
//  Created by mohamed sliem on 01/05/2024.
//

import XCTest
import Utilits
import OHHTTPStubs
import OHHTTPStubsSwift

@testable import Alula

final class LoginNetworkServiceTests: XCTestCase {

    let endpoint = LoginAPIEndpoint.loginEndpoint()
    var networkStub: LoginNetworkServiceStub?
    
    override func setUp() {
        networkStub = LoginNetworkServiceStub()
    }
    
    override func tearDown() {
        networkStub = nil
    }
    
    func testSchema() {
        let schema = endpoint.schema
        let expectedSchema = "https"
        XCTAssertEqual(schema, expectedSchema)
    }

    func testHost() {
        let host = endpoint.host
        let expectedHost = "api.escuelajs.co"
        XCTAssertEqual(host, expectedHost)
    }

    func testPath() {
        let path = endpoint.path
        let expectedPath = "/api/v1/auth/login"
        XCTAssertEqual(path, expectedPath)
    }

    func testHeaders() {
        let headers = endpoint.headers
        let expectedHeaders =  [
            "Content-Type": "application/json"
        ]
        XCTAssertEqual(headers, expectedHeaders)
    }

    func testHttpMethod() {
        let httpMethod = endpoint.httpMethod
        let expectedMethod = HTTPMethod.post
        XCTAssertEqual(httpMethod, expectedMethod)
    }

    func testBuildUrl() throws {

        let url = try NetworkService.shared.buildUrl(
            scheme: endpoint.schema,
            host: endpoint.host,
            path: endpoint.path,
            queryItems: endpoint.queryParameters,
            port: endpoint.port
        ).absoluteString

        let expectedURL =  "https://api.escuelajs.co/api/v1/auth/login"

        XCTAssertEqual(url, expectedURL)
    }

    func testBuildRequest() throws {
        var request: URLRequest?
        var url: URL?

        do {
            url = try NetworkService.shared.buildUrl(
                scheme: endpoint.schema,
                host: endpoint.host,
                path: endpoint.path,
                queryItems: endpoint.queryParameters,
                port: endpoint.port
            )
        } catch {
            XCTAssertThrowsError(error)
        }

        let expectedURL = URL(string: "https://api.escuelajs.co/api/v1/auth/login")
        let expectedHeaders = [
            "Content-Type": "application/json"
        ]

        do {
            request = try NetworkService.shared.buildRequest(
                url: url!,
                httpMethod: endpoint.httpMethod,
                httpBody: loginBodyObject,
                headers: endpoint.headers
            )
        } catch {
            XCTAssertThrowsError(error)
        }

        XCTAssertEqual(request?.url, expectedURL)
        XCTAssertEqual(request?.httpMethod, HTTPMethod.post.rawValue)
        XCTAssertEqual(request?.allHTTPHeaderFields, expectedHeaders)
    }

    func testSuccessSignupRequest() async throws {
        
        networkStub?.loginSuccessRequestStub()
        
        var expectedResponse: TokenDto?
        let exception = expectation(description: "NetworkError")

        do {
            expectedResponse = try await NetworkService.shared.request(
                endpoint: endpoint,
                model: TokenDto.self,
                body: loginBodyObject
            )
            exception.fulfill()
        } catch {
            XCTAssertNotNil(error)
        }

        await fulfillment(of: [exception], timeout: 2)
        XCTAssertNotNil(expectedResponse)
    }

    func testFailedSignupRequest() async throws {
        
        networkStub?.loginFailedRequestStub()
        
        let exception = expectation(description: "Request Failed")
        var expectedResponse: TokenDto?

        do {
            expectedResponse = try await NetworkService.shared.request(
                endpoint: endpoint,
                model: TokenDto.self,
                body: loginBodyObject
            )
            XCTFail("Should not complete the request")
        } catch {
            exception.fulfill()
            XCTAssertNotNil(error)
        }

        await fulfillment(of: [exception], timeout: 2)
        XCTAssertNil(expectedResponse)
    }

}

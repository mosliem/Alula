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

    let endpoint = SignupAPIEndpoint.signup()

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
        let expectedPath = "/api/v1/users/"
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

        let expectedURL = "https://api.escuelajs.co/api/v1/users/"

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

        let expectedURL = URL(string: "https://api.escuelajs.co/api/v1/users/")
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

        let expectedURL = "https://api.escuelajs.co/api/v1/users/"

        stub(condition: isAbsoluteURLString(expectedURL)) { _ in
            let responsePath = OHPathForFile("signup.json", type(of: self))!
            return fixture(filePath: responsePath, status: 200, headers: nil)
        }

        var expectedResponse: UserSignupDto?
        let exception = expectation(description: "NetworkError")

        do {
            expectedResponse = try await NetworkService.shared.request(
                endpoint: endpoint,
                model: UserSignupDto.self,
                body: loginBodyObject
            )
            exception.fulfill()
        } catch {
            XCTAssertThrowsError(error)
        }

        await fulfillment(of: [exception], timeout: 2)
        XCTAssertNotNil(expectedResponse)
        XCTAssertTrue(expectedResponse?.id == 10)

    }

    func testFailedSignupRequest() async throws {
        let expectedURL = "https://api.escuelajs.co/api/v1/users/"

        stub(condition: isAbsoluteURLString(expectedURL)) { _ in
            let responsePath = OHPathForFile("loginInvalid.json", type(of: self))!
            return fixture(filePath: responsePath, status: 200, headers: nil)
        }

        let exception = expectation(description: "Request Failed")
        var expectedResponse: UserSignupDto?

        do {
            expectedResponse = try await NetworkService.shared.request(
                endpoint: endpoint,
                model: UserSignupDto.self,
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

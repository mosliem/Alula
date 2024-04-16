//
//  Endpoint.swift
//  Alula
//
//  Created by mohamed sliem on 26/03/2024.
//

import Foundation
import Utilits

class Endpoint: Requsetable {
    var schema: String

    var host: String

    var path: String

    var queryParameters: [String: Any]?

    var port: Int?

    var headers: [String: String]?

    var httpMethod: Utilits.HTTPMethod

    var httpBody: Data?

    var timeoutInterval: TimeInterval?

    var networkService: URLRequest.NetworkServiceType?

    init(
        schema: String,
        host: String,
        path: String,
        queryParameters: [String: Any]? = nil,
        port: Int? = nil,
        headers: [String: String]? = nil,
        httpMethod: Utilits.HTTPMethod,
        httpBody: Data? = nil,
        timeoutInterval: TimeInterval? = nil,
        networkService: URLRequest.NetworkServiceType? = nil
    ) {
        self.schema = schema
        self.host = host
        self.path = path
        self.queryParameters = queryParameters
        self.port = port
        self.headers = headers
        self.httpMethod = httpMethod
        self.httpBody = httpBody
        self.timeoutInterval = timeoutInterval
        self.networkService = networkService
    }
}

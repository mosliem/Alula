//
//  LoginAPIEndpoint.swift
//  Alula
//
//  Created by mohamed sliem on 27/03/2024.
//

import Foundation
import Utilits

struct LoginAPIEndpoint {
    static func loginEndpoint() -> Endpoint {
        return Endpoint(
            schema: "https",
            host: "api.escuelajs.co",
            path: "/api/v1/auth/login",
            headers: ["Content-Type": "application/json"],
            httpMethod: .post
        )
    }
}

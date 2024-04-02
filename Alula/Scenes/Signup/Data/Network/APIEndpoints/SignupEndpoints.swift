//
//  APIEndpoint.swift
//  Alula
//
//  Created by mohamed sliem on 26/03/2024.
//

import Foundation
import Utilits

struct SignupAPIEndpoint {
    static func signup() -> Requsetable{
        return Endpoint(
            schema: "https",
            host: "api.escuelajs.co",
            path: "/api/v1/users/",
            headers:[
                "Content-Type": "application/json"
            ],
            httpMethod: .post
        )
    }
}

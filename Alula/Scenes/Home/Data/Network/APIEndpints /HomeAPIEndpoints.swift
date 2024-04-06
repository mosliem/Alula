//
//  HomeAPIEndpoints.swift
//  Alula
//
//  Created by mohamed sliem on 03/04/2024.
//

import Foundation


struct HomeAPIEndpoint {
    static func HomeEndpoint() -> Endpoint {
        return Endpoint(
            schema: "https",
            host: "api.escuelajs.co",
            path: HomeApiPath.getProducts,
            queryParameters: ["limit": 10, "offset": 1],
            headers: ["Content-Type": "application/json"],
            httpMethod: .get
        )
    }
}

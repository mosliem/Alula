//
//  HomeRepositoryProtocol.swift
//  Alula
//
//  Created by mohamed sliem on 03/04/2024.
//

import Foundation
import Utilits
import Combine

protocol HomeRepositoryProtocol {
    func getProducts(endpoint: Requsetable) -> AnyPublisher<ProductsResponseDto, APIError>
    func cacheProducts(products: [Product])
}


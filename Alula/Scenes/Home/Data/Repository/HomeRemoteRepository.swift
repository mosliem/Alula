//
//  HomeRemoteRepository.swift
//  Alula
//
//  Created by mohamed sliem on 03/04/2024.
//

import Foundation
import Combine
import Utilits

protocol HomeRemoteRepositoryProtocol{
    func getProducts(endpoint: Requsetable) -> AnyPublisher<ProductsResponseDto, APIError>
}

class HomeRemoteRepository: HomeRemoteRepositoryProtocol {
    func getProducts(endpoint: Requsetable) -> AnyPublisher<ProductsResponseDto, APIError> {
        return NetworkManager.shared.executeRequest(
            with: endpoint,
            model: ProductsResponseDto.self, body: [:]
        )
    }

}

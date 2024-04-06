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
    func getProducts(endpoint: Requsetable) -> AnyPublisher<[ProductDto], APIError>
}

class HomeRemoteRepository: HomeRemoteRepositoryProtocol {
    func getProducts(endpoint: Requsetable) -> AnyPublisher<[ProductDto], APIError> {
        return NetworkManager.shared.executeRequest(
            with: endpoint,
            model: [ProductDto].self, body: [:]
        )
    }

}

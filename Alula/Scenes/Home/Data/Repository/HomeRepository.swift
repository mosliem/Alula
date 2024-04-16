//
//  Repository.swift
//  Alula
//
//  Created by mohamed sliem on 03/04/2024.
//

import Foundation
import Combine
import Utilits

class HomeRepository: HomeRepositoryProtocol {

    var remoteRepository: HomeRemoteRepositoryProtocol
    var localRepository: HomeLocalRepositoryProtocol

    init(remoteRepository: HomeRemoteRepositoryProtocol, localRepository: HomeLocalRepositoryProtocol) {
        self.remoteRepository = remoteRepository
        self.localRepository = localRepository
    }

    func getProducts(endpoint: Requsetable) -> AnyPublisher<[ProductDto], APIError> {
        return remoteRepository.getProducts(endpoint: endpoint)
    }

    func cacheProducts(products: [ProductEntity]) {
        localRepository.cacheProducts(products: products)
    }
}

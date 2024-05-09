//
//  fetchProductUsecaseProtocol.swift
//  Alula
//
//  Created by mohamed sliem on 03/04/2024.
//

import Foundation

protocol FetchProductsUsecaseProtocol {
    var products: [ProductEntity]? { get set }
    func fetchProducts()
}

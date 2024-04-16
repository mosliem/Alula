//
//  ProductsAdapter.swift
//  Alula
//
//  Created by mohamed sliem on 16/04/2024.
//

import Foundation

protocol ProductsAdapterProtocol {
    func adapt(products: [ProductDto]) -> [ProductEntity]
}

class ProductsAdapter: ProductsAdapterProtocol {

    func adapt(products: [ProductDto]) -> [ProductEntity] {
        var productsEntity = [ProductEntity]()
        for product in products {

            let entity =  ProductEntity(
                id: product.id ?? 0,
                title: product.title ?? "",
                price: product.price ?? 0,
                description: product.description ?? "",
                category: product.category?.toDomain() ??
                CategoryEntity(id: 10, name: "", image: URL(string: "")!),
                images: product.images ?? []
            )

            productsEntity.append(entity)
        }

        return productsEntity
    }
}

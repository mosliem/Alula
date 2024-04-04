//
//  ProductsDto.swift
//  Alula
//
//  Created by mohamed sliem on 03/04/2024.
//

import Foundation

struct ProductsResponseDto: Codable {
    var products: [ProductsDto]
}

extension ProductsResponseDto {
    func toDomain() -> [ProductEntity]{
        var absoluteProducts = [ProductEntity]()
        for product in products {
            let p = product.toDomain()
            absoluteProducts.append(p)
        }
        return absoluteProducts
    }
}

struct ProductsDto: Codable {
    var id: Int?
    var title: String?
    var price: Int?
    var description: String?
    var category: CategoryDto?
    var images: [String]?
    var creationAt: String?
    var updatedAt: String?
    
}

extension ProductsDto {
    func toDomain() -> ProductEntity{
        .init(id: id ?? 0,
              title: title ?? "",
              price: price ?? 0,
              description: description ?? "",
              category: category?.toDomain() ?? CategoryEntity(id: 10, name: "",image: ""),
              images: []
        )
    }
}

struct CategoryDto: Codable{
    var id: Int?
    var name: String?
    var image: String?
    var creationAt: String?
    var updatedAt: String?
}

extension CategoryDto {
    func toDomain() -> CategoryEntity {
        .init(id: id ?? 0, name: name ?? "", image: image ?? "")
    }
}

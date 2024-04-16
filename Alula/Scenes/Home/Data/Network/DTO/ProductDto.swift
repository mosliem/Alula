//
//  ProductsDto.swift
//  Alula
//
//  Created by mohamed sliem on 03/04/2024.
//

import Foundation

struct ProductDto: Codable {
    var id: Int?
    var title: String?
    var price: Int?
    var description: String?
    var category: CategoryDto?
    var images: [URL]?
    var creationAt: String?
    var updatedAt: String?

}

// extension ProductDto {
//    func toDomain() -> ProductEntity {
//        .init(id: id ?? 0,
//              title: title ?? "",
//              price: price ?? 0,
//              description: description ?? "",
//              category: category?.toDomain() ?? CategoryEntity(id: 10, name: "", image: URL(string: "")!),
//              images: []
//        )
//    }
// }

struct CategoryDto: Codable {
    var id: Int?
    var name: String?
    var image: URL?
    var creationAt: String?
    var updatedAt: String?
}

extension CategoryDto {
    func toDomain() -> CategoryEntity {
        .init(id: id ?? 0, name: name ?? "", image: image ?? URL(string: "")!)
    }
}

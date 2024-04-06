//
//  Product.swift
//  Alula
//
//  Created by mohamed sliem on 03/04/2024.
//

import Foundation

struct ProductEntity {
    var id: Int
    var title: String
    var price: Int
    var description: String
    var category: CategoryEntity
    var images: [URL]
}



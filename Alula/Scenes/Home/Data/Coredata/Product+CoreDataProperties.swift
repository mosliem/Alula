//
//  Product+CoreDataProperties.swift
//  Alula
//
//  Created by mohamed sliem on 03/04/2024.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: Int32
    @NSManaged public var price: Int32
    @NSManaged public var productDescription: String?
    @NSManaged public var images: NSObject?
    @NSManaged public var category: Category?

}

extension Product : Identifiable {

}

//
//  Category+CoreDataProperties.swift
//  Alula
//
//  Created by mohamed sliem on 03/04/2024.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var image: String?

}

extension Category : Identifiable {

}

//
//  CoredataStorage.swift
//  Alula
//
//  Created by mohamed sliem on 04/04/2024.
//

import CoreData

class CoredataStorage {
    static let shared = CoredataStorage()

    private init(){}
    
    private lazy var context = presistanceContainer.viewContext
    private lazy var presistanceContainer: NSPersistentContainer = {
        let container =  NSPersistentContainer(name: "Products")
        container.loadPersistentStores { _, error in
            guard error == nil else {
                print(error.debugDescription)
                fatalError("Can't load core data")
            }
        }
        return container
    }()
    
    func save() {
        if context.hasChanges{
            do{
                try context.save()
                print("Saved")
            }
            catch{
                print(error.localizedDescription)
                fatalError("can't save")
            }
        }
    }
    
    
    //MARK: - Creating Entities 
    func createProduct(storedProduct: ProductEntity){
        let product = Product(context: context)
        product.id = Int32(storedProduct.id)
        product.category = createCategory(storedCategory: storedProduct.category)
        product.price = Double(storedProduct.price)
        product.name = storedProduct.title
        product.info = storedProduct.description
        save()
    }
    
    @discardableResult
    func createCategory(storedCategory: CategoryEntity) -> Category {
        let category = Category(context: context)
        category.id = Int32(storedCategory.id)
        category.name = storedCategory.name
        return category
    }
}

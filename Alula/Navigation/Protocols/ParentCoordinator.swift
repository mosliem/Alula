//
//  ParentCoordinator.swift
//  Alula
//
//  Created by mohamed sliem on 27/03/2024.
//

import UIKit

protocol ParentCoordinator: Coordinator {
    var childCoordinators: [Coordinator] {get set}
    func addChild(_ child: Coordinator?)
    func childDidFinish(_ child: Coordinator?)
}

extension ParentCoordinator {
    
    func addChild(_ child: Coordinator?){
        if let childCoordinator = child {
            childCoordinators.append(childCoordinator)
        }
    }
    
    func childDidFinish(_ child: Coordinator?){
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}

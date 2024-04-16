//
//  Coordinator.swift
//  Alula
//
//  Created by mohamed sliem on 03/04/2024.

import UIKit

// Base functionality for all coordinators
protocol Coordinator: AnyObject {
    var navigationController: UINavigationController {get set}
    func start(animated: Bool)
}

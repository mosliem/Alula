//
//  FactoryProtocol.swift
//  Alula
//
//  Created by mohamed sliem on 17/04/2024.
//

import UIKit

enum SceneType {
    case home
    case login
    case signup
}

// DI container protocol
protocol FactoryProtocol {
    func createVC(for scene: SceneType, with coordinator: Coordinator) -> UIViewController
}

// DI Factory protocol which compatable to work with passing coordinator ref.
protocol DependenciesFactory {
    func create(with coordinator: Coordinator) -> UIViewController
}

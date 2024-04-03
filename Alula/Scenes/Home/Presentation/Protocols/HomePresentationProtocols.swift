//
//  HomePresentationProtocols.swift
//  Alula
//
//  Created by mohamed sliem on 03/04/2024.
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    var viewModel: HomeViewModelProtocol! { get set }
}

protocol HomeViewModelProtocol: AnyObject {
    func viewDidLoad()
}

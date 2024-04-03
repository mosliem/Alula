//
//  LoginPresentationProtocols.swift
//  Alula
//
//  Created by mohamed sliem on 27/03/2024.
//

import Foundation

protocol LoginViewProtocol: AnyObject {
    var viewModel: LoginViewModelProtocol! { get set }
}

typealias LoginViewModelProtocol = LoginViewModelInputProtocol & LoginViewModelOutputProtocol

protocol LoginViewModelInputProtocol: AnyObject {
    func viewDidLoad()
}

protocol LoginViewModelOutputProtocol: AnyObject {
    var loginState: Observable<String> { get set }
}

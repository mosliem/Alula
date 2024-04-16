//
//  PresentationProtocols.swift
//  Alula
//
//  Created by mohamed sliem on 27/03/2024.
//

import Foundation

protocol SignupViewProtocol: AnyObject {
    var viewModel: SignupViewModelProtocol! { get set }
}

typealias SignupViewModelProtocol = SignupViewModelInputProtocol & SignupViewModelOutputProtocol

protocol SignupViewModelInputProtocol: AnyObject {
    func viewDidLoad()
    func loginPressed()
    func signupPressed()
}

protocol SignupViewModelOutputProtocol: AnyObject {

}

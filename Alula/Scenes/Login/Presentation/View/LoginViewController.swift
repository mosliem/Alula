//
//  LoginViewController.swift
//  Alula
//
//  Created by mohamed sliem on 03/04/2024.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginState: UILabel!
    var viewModel: LoginViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        bindViewModel()
    }
    
    private func bindViewModel(){
        viewModel.loginState.observer = { [weak self] state in
            self?.loginState.text = state
        }
    }

}

extension LoginViewController: LoginViewProtocol {}

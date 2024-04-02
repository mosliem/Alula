//
//  SignupViewController.swift
//  Alula
//
//  Created by mohamed sliem on 03/04/2024.
//

import UIKit

class SignupViewController: UIViewController {
    
    var viewModel: SignupViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        viewModel.loginPressed()
    }
    
    private func bindViewModel(){
        viewModel.signupState.observer = { [weak self] state in
            self?.signupState.text = state
        }
    }
}

extension SignupViewController: SignupViewProtocol {}

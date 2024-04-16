//
//  LoginViewController.swift
//  Alula
//
//  Created by mohamed sliem on 03/04/2024.
//

import UIKit

class LoginViewController: UIViewController, LoginViewProtocol {

    var viewModel: LoginViewModelProtocol!
    @IBOutlet weak var emailTextField: FloatingLabelTextField!
    @IBOutlet weak var passwordTextField: FloatingLabelTextField!
    @IBOutlet weak var newUserButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        bindViewModel()
        setupViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    private func bindViewModel() {}

    private func setupViews() {
        setupTextFields()
        setupLoginButton()
        setupNewUserButton()
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        viewModel.loginPressed()
    }
    @IBAction func newUserPressed(_ sender: UIButton) {
        viewModel.newUserPressed()
    }
}

extension LoginViewController {
    func setupTextFields() {
        emailTextField.setupFloatingTextField(
            placeholder: "Email",
            title: "Email",
            icon: .emailIcon
        )
        passwordTextField.setupFloatingTextField(
            placeholder: "Password",
            title: "Password",
            icon: .passwordIcon
        )
    }

    private func setupLoginButton() {
        loginButton.roundView(cornerRadius: 10)
    }

    private func setupNewUserButton() {
        newUserButton.roundView(cornerRadius: 10)
        let title = NSMutableAttributedString(string: "New User?  Signup")
        title.addAttributes(
            [
                .foregroundColor: UIColor.black,
                .font: FontSystem.font(.neueHaasMedui, size: 14) ?? FontSystem.font(.defaultFont, size: 14)!
            ],
            range: NSRange(location: 0, length: 9)
        )
        title.addAttributes(
            [
                .foregroundColor: UIColor.primary,
                .font: FontSystem.font(.neueHaasMedui, size: 14) ?? FontSystem.font(.defaultFont, size: 14)!
            ],
            range: NSRange(location: 9, length: 8)
        )
        newUserButton.setAttributedTitle(title, for: .normal)
    }

}

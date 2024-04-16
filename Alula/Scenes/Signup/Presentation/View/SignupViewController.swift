//
//  SignupViewController.swift
//  Alula
//
//  Created by mohamed sliem on 03/04/2024.
//

import UIKit
import Utilits

class SignupViewController: UIViewController, SignupViewProtocol {

    var viewModel: SignupViewModelProtocol!
    @IBOutlet weak var firstNameTextField: FloatingLabelTextField!
    @IBOutlet weak var lastNameTextField: FloatingLabelTextField!
    @IBOutlet weak var phoneNumberTextField: FloatingLabelTextField!
    @IBOutlet weak var emailTextField: FloatingLabelTextField!
    @IBOutlet weak var passwordTextField: FloatingLabelTextField!

    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var alreadyMemberButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        bindViewModel()
        setupViews()
    }

    private func setupViews() {
        setupTextFields()
        setupSignupButton()
        setupAlreadyMemberButton()
    }

    private func bindViewModel() {}

    @IBAction func signupButtonPressed(_ sender: UIButton) {
        viewModel.signupPressed()
    }

    @IBAction func alreadyMemberPressed(_ sender: UIButton) {
        viewModel.loginPressed()
    }

}

extension SignupViewController {

    private func setupSignupButton() {
        signupButton.roundView(cornerRadius: 10)
    }

    private func setupAlreadyMemberButton() {
        alreadyMemberButton.roundView(cornerRadius: 10)
        let title = NSMutableAttributedString(string: "Already Member?  Login")
        title.addAttributes(
            [
                .foregroundColor: UIColor.black,
                .font: FontSystem.font(.neueHaasMedui, size: 14) ?? FontSystem.font(.defaultFont, size: 14)!
            ],
            range: NSRange(location: 0, length: 15)
        )
        title.addAttributes(
            [
                .foregroundColor: UIColor.primary,
                .font: FontSystem.font(.neueHaasMedui, size: 14) ?? FontSystem.font(.defaultFont, size: 14)!
            ],
            range: NSRange(location: 15, length: 7)
        )
        alreadyMemberButton.setAttributedTitle(title, for: .normal)
    }
}

extension SignupViewController {
    private func setupTextFields() {
        firstNameTextField.setupFloatingTextField(
            placeholder: "First Name",
            title: "First Name",
            icon: .nameIcon
        )

        lastNameTextField.setupFloatingTextField(
            placeholder: "Last Name",
            title: "Last Name",
            icon: .nameIcon
        )

        phoneNumberTextField.setupFloatingTextField(
            placeholder: "Phone",
            title: "Phone"
        )

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

}

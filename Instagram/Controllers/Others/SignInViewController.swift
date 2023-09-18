//
//  SignInViewController.swift
//  Instagram
//
//  Created by Mohammad Afshar on 15/09/2023.
//

import UIKit

class SignInViewController: UIViewController {
    private let signInHeader = SignInHeaderView()
    private let emailTextField: IGTextField = {
        let emailField = IGTextField()
        emailField.placeholder = "Email Address"
        emailField.keyboardType = .emailAddress
        emailField.returnKeyType = .continue
        return emailField
    }()
    private let passwordTextField: IGTextField = {
        let passwordField = IGTextField()
        passwordField.placeholder = "Password"
        passwordField.keyboardType = .default
        passwordField.isSecureTextEntry = true
        passwordField.returnKeyType = .next
        return passwordField
    }()
    private let signInButton: UIButton = {
        let signInBT = UIButton()
        signInBT.backgroundColor = .systemBlue
        signInBT.layer.cornerRadius = 8
        signInBT.layer.masksToBounds = true
        signInBT.setTitle("Sign In", for: .normal)
        return signInBT
    }()
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.link, for: .normal)
        button.setTitle("Create Account", for: .normal)
        return button
    }()
    private let TermOfServicesButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.link, for: .normal)
        button.setTitle("Term of Services", for: .normal)
        return button
    }()
    private let privacyPolicyButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.link, for: .normal)
        button.setTitle("Privace Policy", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign in"
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(signInHeader)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
        view.addSubview(createAccountButton)
        view.addSubview(TermOfServicesButton)
        view.addSubview(privacyPolicyButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signInHeader.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: (view.height - view.safeAreaInsets.top)/3)
        emailTextField.frame = CGRect(x: 25, y: signInHeader.bottom+20, width: view.width-50, height: 50)
        passwordTextField.frame = CGRect(x: 25, y: emailTextField.bottom+10, width: view.width-50, height: 50)
        signInButton.frame = CGRect(x: 35, y: passwordTextField.bottom+15, width: view.width-70, height: 50)
        createAccountButton.frame = CGRect(x: 35, y: signInButton.bottom+15, width: view.width-70, height: 40)
        TermOfServicesButton.frame = CGRect(x: 35, y: createAccountButton.bottom+50, width: view.width-70, height: 40)
        privacyPolicyButton.frame = CGRect(x: 35, y: TermOfServicesButton.bottom+10, width: view.width-70, height: 40)
    }
}

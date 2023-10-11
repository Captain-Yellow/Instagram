//
//  SignInViewController.swift
//  Instagram
//
//  Created by Mohammad Afshar on 15/09/2023.
//

import UIKit
import SafariServices

class SignInViewController: UIViewController, UITextFieldDelegate {
    private let signInHeader = SignInHeaderView()
    
    // MARK: - Components
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
    private let termOfServicesButton: UIButton = {
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
        addSubviews()
        addButtonActions()
        passwordTextField.delegate = self
        emailTextField.delegate = self
    }
    
    private func addSubviews() {
        view.addSubview(signInHeader)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
        view.addSubview(createAccountButton)
        view.addSubview(termOfServicesButton)
        view.addSubview(privacyPolicyButton)
    }
    
    private func addButtonActions() {
        signInButton.addTarget(self, action: #selector(letMeGo/*didSignInTapped*/), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(didCreateAccountTapped), for: .touchUpInside)
        termOfServicesButton.addTarget(self, action: #selector(didTermOfServicesTapped), for: .touchUpInside)
        privacyPolicyButton.addTarget(self, action: #selector(didPrivacyPolicyTapped), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signInHeader.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: (view.height - view.safeAreaInsets.top)/3)
        emailTextField.frame = CGRect(x: 25, y: signInHeader.bottom+20, width: view.width-50, height: 50)
        passwordTextField.frame = CGRect(x: 25, y: emailTextField.bottom+10, width: view.width-50, height: 50)
        signInButton.frame = CGRect(x: 35, y: passwordTextField.bottom+15, width: view.width-70, height: 50)
        createAccountButton.frame = CGRect(x: 35, y: signInButton.bottom+15, width: view.width-70, height: 40)
        termOfServicesButton.frame = CGRect(x: 35, y: createAccountButton.bottom+50, width: view.width-70, height: 40)
        privacyPolicyButton.frame = CGRect(x: 35, y: termOfServicesButton.bottom+10, width: view.width-70, height: 40)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            textField.becomeFirstResponder()
        }
        
        return true
    }
    
    // MARK: - Buttons Actions
    /*
    @objc private func didSignInTapped() {
        guard let email = emailTextField.text, let pass = passwordTextField.text, !email.trimmingCharacters(in: .whitespaces).isEmpty, !pass.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        emailTextField.becomeFirstResponder()
        passwordTextField.becomeFirstResponder()
        
        AuthManager.shared.signIn(email: email, password: pass) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                    case .success:
                        let tabVC = TabBarViewController()
                        tabVC.modalPresentationStyle = .fullScreen
                        self?.present(tabVC, animated: true)
                    case .failure(let error):
                        print(error)
                }
            }
        }
    }
    */
    @objc private func didCreateAccountTapped() {
        let vc = SignUpViewController()
        vc.complition = { [weak self] in
            DispatchQueue.main.async {
                let tabVC = TabBarViewController()
                tabVC.modalPresentationStyle = .fullScreen
                self?.present(tabVC, animated: true)
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func didTermOfServicesTapped() {
        guard let url = URL(string: "https://www.instagram.com") else {return}
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc private func didPrivacyPolicyTapped() {
        guard let url = URL(string: "") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc private func letMeGo() {
        DispatchQueue.main.async {
            let tabVC = TabBarViewController()
            tabVC.modalPresentationStyle = .fullScreen
            self.navigationController?.popToRootViewController(animated: true)
            self.present(tabVC, animated: true)
        }
    }
}

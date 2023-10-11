//
//  SignUpViewController.swift
//  Instagram
//
//  Created by Mohammad Afshar on 15/09/2023.
//

import UIKit
import SwiftUI
import SafariServices

class SignUpViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Components
    private let userProfilePhotoImageView: UIImageView = {
        let profilePhoto = UIImageView()
        profilePhoto.image = UIImage(systemName: "person.circle")
        profilePhoto.clipsToBounds = true
        profilePhoto.contentMode = .scaleAspectFill
        profilePhoto.tintColor = .systemGray
        profilePhoto.layer.cornerRadius = 40
        profilePhoto.layer.masksToBounds = true
        return profilePhoto
    }()
    private let usernameTextField: IGTextField = {
        let emailField = IGTextField()
        emailField.placeholder = "Username"
        emailField.keyboardType = .default
        emailField.returnKeyType = .continue
        return emailField
    }()
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
    private let signUpButton: UIButton = {
        let signInBT = UIButton()
        signInBT.backgroundColor = .systemGreen
        signInBT.layer.cornerRadius = 8
        signInBT.layer.masksToBounds = true
        signInBT.setTitle("Sign Up", for: .normal)
        return signInBT
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
    
    public var complition: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign Up"
        view.backgroundColor = .secondarySystemBackground
        addSubviews()
        addButtonActions()
        addProfilePhotoGesture()
        mainViewTapGesture()
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.delegate = self
    }
    
    private func addSubviews() {
        view.addSubview(userProfilePhotoImageView)
        view.addSubview(usernameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signUpButton)
        view.addSubview(termOfServicesButton)
        view.addSubview(privacyPolicyButton)
    }
    
    private func addButtonActions() {
        signUpButton.addTarget(self, action: #selector(didSignUpTapped), for: .touchUpInside)
        termOfServicesButton.addTarget(self, action: #selector(didTermOfServicesTapped), for: .touchUpInside)
        privacyPolicyButton.addTarget(self, action: #selector(didPrivacyPolicyTapped), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let profilePhotoSize: CGFloat = 90
        userProfilePhotoImageView.frame = CGRect(x: (view.width-profilePhotoSize)/2, y: view.safeAreaInsets.top+15, width: profilePhotoSize, height: profilePhotoSize)
        usernameTextField.frame = CGRect(x: 25, y: userProfilePhotoImageView.bottom+20, width: view.width-50, height: 50)
        emailTextField.frame = CGRect(x: 25, y: usernameTextField.bottom+10, width: view.width-50, height: 50)
        passwordTextField.frame = CGRect(x: 25, y: emailTextField.bottom+10, width: view.width-50, height: 50)
        signUpButton.frame = CGRect(x: 35, y: passwordTextField.bottom+15, width: view.width-70, height: 50)
        termOfServicesButton.frame = CGRect(x: view.width/4, y: signUpButton.bottom+50, width: view.width/2, height: 40)
        privacyPolicyButton.frame = CGRect(x: view.width/4, y: termOfServicesButton.bottom+10, width: view.width/2, height: 40)
    }
    
    // MARK: - Delegates
    // TextField Delegate
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            usernameTextField.becomeFirstResponder()
        } else if textField == emailTextField {
            emailTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    // Image Picker Delegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.userProfilePhotoImageView.image = image
        } else {
            return
        }
        picker.dismiss(animated: true)
    }
    
    // MARK: - Buttons Actions
    @objc func didProfilePhotoTapped() {
        let sheet = UIAlertController(title: "Which way you perfer", message: "Please Chose a way to upload profile photo", preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title: "Galary", style: .default) { [weak self] action in
            DispatchQueue.main.async {
                let pickerConfig = UIImagePickerController()
                pickerConfig.sourceType = .photoLibrary
                pickerConfig.allowsEditing = true
                pickerConfig.delegate = self
                self?.present(pickerConfig, animated: true)
            }
        })
        sheet.addAction(UIAlertAction(title: "Camera", style: .default) { [weak self] action in
            DispatchQueue.main.async{
                let picker = UIImagePickerController()
                picker.sourceType = .camera
                picker.allowsEditing = true
                picker.delegate = self
                guard let self = self else {return}
                self.present(picker, animated: true)
            }
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        cancel.setValue(UIColor.red, forKey: "titleTextColor")
        sheet.addAction(cancel)
        self.present(sheet, animated: true)
    }
    
    @objc private func didSignUpTapped() {
        usernameTextField.becomeFirstResponder()
        emailTextField.becomeFirstResponder()
        passwordTextField.becomeFirstResponder()
        
        guard let email = emailTextField.text,
              let pass = passwordTextField.text,
              let username = usernameTextField.text,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !pass.trimmingCharacters(in: .whitespaces).isEmpty,
              !username.trimmingCharacters(in: .whitespaces).isEmpty,
              pass.count >= 6,
              username.count >= 3,
              username.trimmingCharacters(in: .alphanumerics).isEmpty 
        else {
            showAlertError()
            return
        }
        AuthManager.shared.signUp(email: email,
                                  password: pass,
                                  username: username,
                                  profilePicture: userProfilePhotoImageView.image?.pngData()) { [weak self] result in
            switch result {
                case .success(let user):
                    DispatchQueue.main.async {
                        UserDefaults.standard.setValue(user.email, forKey: "email")
                        UserDefaults.standard.setValue(user.username, forKey: "username")
                        self?.navigationController?.popToRootViewController(animated: true)
                        self?.complition?()
                    }
                case .failure(let error):
                    print(error)
            }
        }
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
    
    // MARK: - Inside Logics Function
    private func addProfilePhotoGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didProfilePhotoTapped))
        userProfilePhotoImageView.isUserInteractionEnabled = true
        userProfilePhotoImageView.addGestureRecognizer(gesture)
    }
    
    // Release Keyboard
    private func mainViewTapGesture() {
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(didTapView))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func didTapView() {
        self.view.endEditing(true)
    }
    
    private func showAlertError() {
        let alert = UIAlertController(title: "Woops", message: "Something in Wrong", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        self.present(alert, animated: true)
    }
}


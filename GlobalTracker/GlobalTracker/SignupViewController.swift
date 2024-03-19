//
//  SignupViewController.swift
//  GlobalTracker
//
//  Created by AndreShan on 2024-03-19.
//

import UIKit
import FirebaseAuth

class SignupViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    

        override func viewDidLoad() {
            super.viewDidLoad()

            // Apply shadow attributes to text fields
            emailTextField.layer.shadowColor = UIColor.black.cgColor
            emailTextField.layer.shadowOpacity = 0.5
            emailTextField.layer.shadowOffset = CGSize(width: 0, height: 2)
            emailTextField.layer.shadowRadius = 3
            emailTextField.frame.size.height = 46
            
            passwordTextField.layer.shadowColor = UIColor.black.cgColor
            passwordTextField.layer.shadowOpacity = 0.5
            passwordTextField.layer.shadowOffset = CGSize(width: 0, height: 2)
            passwordTextField.layer.shadowRadius = 3
            passwordTextField.frame.size.height = 46
            
            confirmPasswordTextField.layer.shadowColor = UIColor.black.cgColor
            confirmPasswordTextField.layer.shadowOpacity = 0.5
            confirmPasswordTextField.layer.shadowOffset = CGSize(width: 0, height: 2)
            confirmPasswordTextField.layer.shadowRadius = 3
            confirmPasswordTextField.frame.size.height = 46
            
            
            signupButton.layer.shadowColor = UIColor.black.cgColor
            signupButton.layer.shadowOpacity = 0.5
            signupButton.layer.shadowOffset = CGSize(width: 0, height: 2)
            signupButton.layer.shadowRadius = 3
            signupButton.tintColor = UIColor(hex: "#577bc4")
        }
    
    @IBAction func signupButtonTapped(_ sender: UIButton) {
            guard let email = emailTextField.text, !email.isEmpty,
                  let password = passwordTextField.text, !password.isEmpty,
                  let confirmPassword = confirmPasswordTextField.text, !confirmPassword.isEmpty else {
                // Show an alert or handle empty fields
                return
            }
            
            if password != confirmPassword {
                // Show an alert or handle password mismatch
                return
            }
            
            // Create user with email and password
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    // Handle error
                    print("Error creating user: \(error.localizedDescription)")
                } else {
                    // User signed up successfully
                    // You can perform further actions here like navigating to another screen
                    print("User created successfully")
                }
            }
        }
}

//
//  SignupViewController.swift
//  GlobeTracker
//
//  Created by AndreShan on 2024-03-13.
//

import UIKit

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
}

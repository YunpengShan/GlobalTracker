//
//  LoginViewController.swift
//  GlobalTracker
//
//  Created by AndreShan on 2024-03-19.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var rememberMeSwitch: UISwitch!
        
    let userDefaults = UserDefaults.standard
    

        override func viewDidLoad() {
            super.viewDidLoad()

            // Apply shadow attributes to text fields
            emailTextField.layer.shadowColor = UIColor.black.cgColor
            emailTextField.layer.shadowOpacity = 0.5
            emailTextField.layer.shadowOffset = CGSize(width: 0, height: 2)
            emailTextField.layer.shadowRadius = 3
            emailTextField.frame.size.height = 46
            
            passwordTextField.isSecureTextEntry = true
            passwordTextField.layer.shadowColor = UIColor.black.cgColor
            passwordTextField.layer.shadowOpacity = 0.5
            passwordTextField.layer.shadowOffset = CGSize(width: 0, height: 2)
            passwordTextField.layer.shadowRadius = 3
            passwordTextField.frame.size.height = 46
            
            
            // Apply shadow attributes to buttons
            loginButton.layer.shadowColor = UIColor.black.cgColor
            loginButton.layer.shadowOpacity = 0.5
            loginButton.layer.shadowOffset = CGSize(width: 0, height: 2)
            loginButton.layer.shadowRadius = 3
            loginButton.frame.size.height = 51
            loginButton.tintColor = UIColor(hex: "#577bc4")
            
            signupButton.layer.shadowColor = UIColor.black.cgColor
            signupButton.layer.shadowOpacity = 0.5
            signupButton.layer.shadowOffset = CGSize(width: 0, height: 2)
            signupButton.layer.shadowRadius = 3
            signupButton.frame.size.height = 51
            signupButton.tintColor = UIColor(hex: "#577bc4")
            
            
            // Load remembered email and password if "Remember Me" is enabled
            if let rememberedEmail = userDefaults.string(forKey: "rememberedEmail"), let rememberedPassword = userDefaults.string(forKey: "rememberedPassword") {
                emailTextField.text = rememberedEmail
                passwordTextField.text = rememberedPassword
            }

            // Retrieve and set the state of the "Remember Me" switch from UserDefaults
            rememberMeSwitch.isOn = userDefaults.bool(forKey: "rememberMeState")
            
            // Add an action for the switch state change
            rememberMeSwitch.addTarget(self, action: #selector(rememberMeSwitchChanged(_:)), for: .valueChanged)
        }
    
    @objc func rememberMeSwitchChanged(_ sender: UISwitch) {
        // Save the state of the "Remember Me" switch to UserDefaults
        userDefaults.set(sender.isOn, forKey: "rememberMeState")
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        // Ensure email and password are not empty
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            // Show an alert or handle empty fields
            return
        }

        // Sign in the user with email and password
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            if let error = error {
                // Handle error
                print("Error signing in: \(error.localizedDescription)")
                // Show an alert indicating login failure
                strongSelf.showLoginFailureAlert()
            } else {
                // User signed in successfully
                print("User signed in successfully")
                
                // Save email and password if "Remember Me" is enabled
                if strongSelf.rememberMeSwitch.isOn {
                    strongSelf.userDefaults.set(email, forKey: "rememberedEmail")
                    strongSelf.userDefaults.set(password, forKey: "rememberedPassword")
                } else {
                    // Clear stored email and password if "Remember Me" is disabled
                    strongSelf.userDefaults.removeObject(forKey: "rememberedEmail")
                    strongSelf.userDefaults.removeObject(forKey: "rememberedPassword")
                }
                
                // Navigate to the tab bar view controller
                strongSelf.navigateToTabBarController()
            }
        }
    }


    private func navigateToTabBarController() {
        // Instantiate the tab bar view controller from storyboard
        guard let tabBarViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarController") as? UITabBarController else {
            return
        }
        // Set it as the root view controller with animation
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let window = windowScene.windows.first {
                UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromRight, animations: {
                    window.rootViewController = tabBarViewController
                }, completion: nil)
            }
        }
    }


    @objc func textFieldDidChange(_ textField: UITextField) {
        // Enable login button only if both email and password are non-empty
        let emailFilled = !(emailTextField.text ?? "").isEmpty
        let passwordFilled = !(passwordTextField.text ?? "").isEmpty
        loginButton.isEnabled = emailFilled && passwordFilled
    }
    
    private func showLoginFailureAlert() {
        let alert = UIAlertController(title: "Login Failed", message: "Invalid email or password. Please try again.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    

}

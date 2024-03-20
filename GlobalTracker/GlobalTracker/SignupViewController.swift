//
//  SignupViewController.swift
//  GlobalTracker
//
//  Created by AndreShan on 2024-03-19.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignupViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    // Firestore reference
    let db = Firestore.firestore()
    
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
        passwordTextField.isSecureTextEntry = true // Make password secure
        
        confirmPasswordTextField.layer.shadowColor = UIColor.black.cgColor
        confirmPasswordTextField.layer.shadowOpacity = 0.5
        confirmPasswordTextField.layer.shadowOffset = CGSize(width: 0, height: 2)
        confirmPasswordTextField.layer.shadowRadius = 3
        confirmPasswordTextField.frame.size.height = 46
        confirmPasswordTextField.isSecureTextEntry = true // Make confirm password secure
        
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
            // Show an alert for password mismatch
            showSignupFailureAlert(message: "Password and confirm password do not match.")
            return
        }
        
        // Create user with email and password
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            
            if let error = error {
                // Handle error
                print("Error creating user: \(error.localizedDescription)")
                // Show an alert indicating signup failure
                strongSelf.showSignupFailureAlert(message: error.localizedDescription)
            } else {
                // User signed up successfully
                print("User created successfully")
                // Obtain the UID of the newly created user
                guard let uid = authResult?.user.uid else {
                    // Handle the case where UID is not available
                    return
                }
                // Create a document in Firestore for the user's data
                strongSelf.createUserDataInFirestore(uid: uid)
                // Create a 'countries' collection under the user's document
                strongSelf.createCountriesCollection(uid: uid)
                // Navigate to login page
                strongSelf.navigateToLoginPage()
            }
        }
    }
    
    private func createUserDataInFirestore(uid: String) {
        // Define the path for the user's data in Firestore
        let userDocRef = db.collection("users").document(uid)
        
        // Create initial data for the user (if needed)
        let userData: [String: Any] = [:] // Add initial user data here if required
        
        // Set the data for the user in Firestore
        userDocRef.setData(userData) { error in
            if let error = error {
                print("Error creating user data in Firestore: \(error.localizedDescription)")
                // Handle error if necessary
            } else {
                print("User data created successfully in Firestore")
                // Optionally, perform any actions after creating user data
            }
        }
    }
    
    private func createCountriesCollection(uid: String) {
        // Define the path for the 'countries' collection under the user's document
        let countriesCollectionRef = db.collection("users").document(uid).collection("countries")
        
        // Add a placeholder document to initialize the collection
        countriesCollectionRef.addDocument(data: [:]) { error in
            if let error = error {
                print("Error creating 'countries' collection: \(error.localizedDescription)")
                // Handle error if necessary
            } else {
                print("Countries collection created successfully")
                // Optionally, perform any actions after creating the collection
            }
        }
    }
    
    private func showSignupFailureAlert(message: String) {
        let alert = UIAlertController(title: "Signup Failed", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func navigateToLoginPage() {
        // Instantiate the login view controller from storyboard
        guard let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
            return
        }
        // Present the login view controller
        navigationController?.pushViewController(loginVC, animated: true)
    }
}

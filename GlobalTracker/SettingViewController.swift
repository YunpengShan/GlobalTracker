//
//  SettingViewController.swift
//  GlobalTracker
//
//  Created by AndreShan on 2024-03-19.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SettingViewController: UIViewController {

    @IBOutlet weak var viewContinentsButton: UIButton!
    @IBOutlet weak var clearVisitedButton: UIButton!
    @IBOutlet weak var clearWantButton: UIButton!
    @IBOutlet weak var privacyButton: UIButton!
    @IBOutlet weak var termsButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    let db = Firestore.firestore()
    
    @IBAction func clearVisitedButtonTapped(_ sender: UIButton) {
        clearVisitedCountries()
    }

    @IBAction func clearWantButtonTapped(_ sender: UIButton) {
        clearWantCountries()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        styleButton(viewContinentsButton)
        styleButton(clearVisitedButton)
        styleButton(clearWantButton)
        styleButton(privacyButton)
        styleButton(termsButton)
        styleButton(logoutButton)
        
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            // Navigate to the login view controller
            navigateToLoginViewController()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    private func navigateToLoginViewController() {
        // Instantiate the login view controller from storyboard
        guard let loginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
            return
        }
        // Set it as the root view controller with animation
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let window = windowScene.windows.first {
                UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromLeft, animations: {
                    window.rootViewController = loginViewController
                }, completion: nil)
            }
        }
    }
    
    private func clearVisitedCountries() {
        guard let currentUserUID = Auth.auth().currentUser?.uid else {
            print("User not logged in")
            return
        }

        let userCountriesRef = db.collection("users").document(currentUserUID).collection("countries")

        // Retrieve all documents that have a 'visitedCountryName' field and delete them
        userCountriesRef.whereField("visitedCountryName", isNotEqualTo: "").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting visited countries documents: \(error)")
            } else {
                for document in snapshot!.documents {
                    document.reference.delete { error in
                        if let error = error {
                            print("Error removing visited country: \(error)")
                        } else {
                            print("Visited country successfully removed!")
                        }
                    }
                }
            }
        }
    }

    private func clearWantCountries() {
        guard let currentUserUID = Auth.auth().currentUser?.uid else {
            print("User not logged in")
            return
        }

        let wantCountriesRef = db.collection("users").document(currentUserUID).collection("countries")

        // Retrieve all documents that have a 'wantCountryName' field and delete them
        wantCountriesRef.whereField("wantCountryName", isNotEqualTo: "").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting want countries documents: \(error)")
            } else {
                for document in snapshot!.documents {
                    document.reference.delete { error in
                        if let error = error {
                            print("Error removing want country: \(error)")
                        } else {
                            print("Want country successfully removed!")
                        }
                    }
                }
            }
        }
    }
    
    // Function to apply common styling to buttons
    private func styleButton(_ button: UIButton) {
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 3
        button.frame.size.height = 51
        button.tintColor = UIColor(hex: "#577bc4")
    }

}

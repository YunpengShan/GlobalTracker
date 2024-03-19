//
//  SettingViewController.swift
//  GlobalTracker
//
//  Created by AndreShan on 2024-03-19.
//

import UIKit
import FirebaseAuth

class SettingViewController: UIViewController {

    @IBOutlet weak var clearVisitedButton: UIButton!
    @IBOutlet weak var clearWantButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Apply shadow attributes to buttons
        clearVisitedButton.layer.shadowColor = UIColor.black.cgColor
        clearVisitedButton.layer.shadowOpacity = 0.5
        clearVisitedButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        clearVisitedButton.layer.shadowRadius = 3
        clearVisitedButton.frame.size.height = 51
        clearVisitedButton.tintColor = UIColor(hex: "#577bc4")
        
        // Apply shadow attributes to buttons
        clearWantButton.layer.shadowColor = UIColor.black.cgColor
        clearWantButton.layer.shadowOpacity = 0.5
        clearWantButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        clearWantButton.layer.shadowRadius = 3
        clearWantButton.frame.size.height = 51
        clearWantButton.tintColor = UIColor(hex: "#577bc4")
        
        // Apply shadow attributes to buttons
        logoutButton.layer.shadowColor = UIColor.black.cgColor
        logoutButton.layer.shadowOpacity = 0.5
        logoutButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        logoutButton.layer.shadowRadius = 3
        logoutButton.frame.size.height = 51
        logoutButton.tintColor = UIColor(hex: "#577bc4")
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
}

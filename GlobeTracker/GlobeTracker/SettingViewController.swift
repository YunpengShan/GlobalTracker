//
//  SettingViewController.swift
//  GlobeTracker
//
//  Created by AndreShan on 2024-03-13.
//

import UIKit

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

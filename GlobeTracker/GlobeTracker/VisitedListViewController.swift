//
//  VisitedListViewController.swift
//  GlobeTracker
//
//  Created by AndreShan on 2024-03-13.
//

import UIKit

class VisitedListViewController: UIViewController {

    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        saveButton.frame.size.height = 51
        saveButton.tintColor = UIColor(hex: "#577bc4")
    }
    
    // Action for the Save button
        @IBAction func saveButtonTapped(_ sender: UIButton) {
            // Perform save operation here
            
            // Show alert to confirm going back
            let alert = UIAlertController(title: "Save Successful", message: "Do you want to go back to the Visited List?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
                // Go back to WantViewController
                self.navigationController?.popViewController(animated: true)
            }))
            
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            
            present(alert, animated: true, completion: nil)
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

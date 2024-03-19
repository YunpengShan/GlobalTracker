//
//  VisitedViewController.swift
//  GlobeTracker
//
//  Created by AndreShan on 2024-03-13.
//

import UIKit

class VisitedViewController: UIViewController {

    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addButton.frame.size.height = 51
        addButton.tintColor = UIColor(hex: "#577bc4")
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

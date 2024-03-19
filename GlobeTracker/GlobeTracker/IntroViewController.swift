//
//  IntroViewController.swift
//  GlobeTracker
//
//  Created by AndreShan on 2024-03-13.
//

import UIKit

class IntroViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.shadowColor = UIColor.black.cgColor
        nextButton.layer.shadowOpacity = 0.5
        nextButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        nextButton.layer.shadowRadius = 3
        nextButton.frame.size.height = 51
        nextButton.tintColor = UIColor(hex: "#577bc4")
    }
}

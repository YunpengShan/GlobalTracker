import UIKit

class TermsAndConditionsViewController: UIViewController {
    
    let terms = TermsAndConditions() // Instantiate the TermsAndConditions class
    @IBOutlet weak var textScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a label to display the terms and conditions
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.text = terms.text
        label.translatesAutoresizingMaskIntoConstraints = false
        
        textScrollView.addSubview(label)
        
        // Set constraints for the label
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: textScrollView.topAnchor),
            label.leadingAnchor.constraint(equalTo: textScrollView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: textScrollView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: textScrollView.bottomAnchor),
            label.widthAnchor.constraint(equalTo: textScrollView.widthAnchor)
        ])
    }
}

import UIKit
import FirebaseFirestore
import FirebaseAuth

// Protocol to notify the delegate when a country is saved
protocol WantViewControllerDelegate: AnyObject {
    func countrySaved()
}

class WantViewController: UIViewController {
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // Firestore reference
    let db = Firestore.firestore()
    
    // Array to store all country names
    let allCountryNames = ["Canada", "China"] // Add more countries as needed
    
    // Array to store search results
    var searchResults: [String] = []
    
    // Array to store current displayed data
    var displayedData: [String] {
        return searchResults.isEmpty ? allCountryNames : searchResults
    }
    
    // Delegate to notify country save
    weak var delegate: WantViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton?.frame.size.height = 51
        saveButton?.tintColor = UIColor(hex: "#577bc4")
        
        tableView?.dataSource = self
        searchBar?.delegate = self
        
        // Add double tap gesture recognizer to table view
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(_:)))
        doubleTapGesture.numberOfTapsRequired = 2
        tableView?.addGestureRecognizer(doubleTapGesture)
    }
    
    // Handle double tap gesture on table view
    @objc func handleDoubleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        guard gestureRecognizer.state == .ended else { return }
        
        let touchPoint = gestureRecognizer.location(in: tableView)
        if let indexPath = tableView.indexPathForRow(at: touchPoint) {
            if indexPath.row < displayedData.count { // Ensure index is within bounds of displayed data
                let selectedCountry = displayedData[indexPath.row]
                searchBar.text = selectedCountry
                searchBar(searchBar, textDidChange: selectedCountry) // Trigger search immediately
            }
        }
    }
    
    // Action for the Save button
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        // Perform save operation here
        // For demonstration, let's assume the first item in search results is selected
        guard let selectedCountry = searchResults.first else {
            // Show alert indicating no country selected
            return
        }
        
        // Save the selected country to Firestore
        saveCountryToFirestore(selectedCountry)
    }
    
    // Function to save a country to Firestore
    func saveCountryToFirestore(_ wantCountryName: String) {
        // Obtain the UID of the currently logged-in user
        guard let currentUserUID = Auth.auth().currentUser?.uid else {
            // Handle the case where user is not logged in
            return
        }
        
        // Construct the path using user's UID
        let userCountriesRef = db.collection("users").document(currentUserUID).collection("countries")
        
        // Check if the country name already exists in Firestore
        userCountriesRef.whereField("wantCountryName", isEqualTo: wantCountryName).getDocuments { [weak self] (snapshot, error) in
            guard let self = self else { return }
            
            if let error = error {
                print("Error checking if country exists: \(error)")
                // Handle error if necessary
                return
            }
            
            if let snapshot = snapshot, !snapshot.isEmpty {
                // Country already exists in Firestore
                print("Country already exists in Firestore")
                
                // Show alert to the user
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Adding Country Failed ❌", message: "The Country Already Exists in your want list.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }

            } else {
                // Country does not exist, proceed with saving
                // Add the country to Firestore
                userCountriesRef.addDocument(data: ["wantCountryName": wantCountryName]) { error in
                    if let error = error {
                        print("Error saving country to Firestore: \(error)")
                        // Handle error if necessary
                    } else {
                        print("Want Country saved successfully to Firestore")
                        // Notify the delegate that a country is saved
                        self.delegate?.countrySaved()
                        
                        // Present an alert indicating successful save
                        // Present an alert indicating successful save
                        let alert = UIAlertController(title: "✅", message: "Want Country Saved", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)

                    }
                }
            }
        }
    }
}

// MARK: - UITableViewDataSource

extension WantViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
        let countryName = displayedData[indexPath.row]
        
        // Get the emoji flag corresponding to the country name
        let flagEmoji: String
        switch countryName {
        case "Canada":
            flagEmoji = "🇨🇦"
        case "China":
            flagEmoji = "🇨🇳"
        // Add cases for more countries as needed
        default:
            flagEmoji = "" // Default to empty string if no flag is available
        }
        
        // Configure cell with country name and flag
        cell.textLabel?.text = "\(flagEmoji) \(countryName)"
        
        // Increase font size
        cell.textLabel?.font = UIFont.systemFont(ofSize: 28) // Adjust the size as needed
        
        return cell
    }
}

// MARK: - UISearchBarDelegate

extension WantViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Perform search operation based on the search text
        searchResults = performSearch(for: searchText)
        tableView?.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // Dismiss keyboard when search button is clicked
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // Reset search results when cancel button is clicked
        searchResults.removeAll()
        tableView.reloadData()
        // Dismiss keyboard when cancel button is clicked
        searchBar.resignFirstResponder()
    }
    
    // Function to perform search operation
    func performSearch(for searchText: String) -> [String] {
        // Filter country names containing the search text
        return allCountryNames.filter { $0.lowercased().contains(searchText.lowercased()) }
    }

}

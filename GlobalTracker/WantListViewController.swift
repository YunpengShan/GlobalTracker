import UIKit
import FirebaseFirestore
import FirebaseAuth

class WantListViewController: UIViewController, WantViewControllerDelegate {
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    // Firestore reference
    let db = Firestore.firestore()
    
    // Array to store country names
    var countryNames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.frame.size.height = 51
        addButton.tintColor = UIColor(hex: "#577bc4")
        
        // Set table view data source
        tableView?.dataSource = self
        // Set table view delegate
        tableView?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Fetch countries data again when the view will appear
        fetchCountriesData()
    }
    
    // Implement the delegate method
    func countrySaved() {
        // Fetch updated data
        fetchCountriesData()
    }
    
    func fetchCountriesData() {
        // Obtain the UID of the currently logged-in user
        guard let currentUserUID = Auth.auth().currentUser?.uid else {
            // Handle the case where user is not logged in
            return
        }
        
        // Construct the path using user's UID
        let userCountriesRef = db.collection("users").document(currentUserUID).collection("countries")
        
        // Get documents from the user-specific collection
        userCountriesRef.getDocuments { [weak self] (snapshot, error) in
            guard let self = self else { return }
            
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                // Check if snapshot contains documents
                if let documents = snapshot?.documents {
                    self.countryNames.removeAll() // Clear previous data
                    for document in documents {
                        // Access each document's data
                        let data = document.data()
                        
                        // Access the countryName field
                        if let wantCountryName = data["wantCountryName"] as? String {
                            // Add country name to array
                            self.countryNames.append(wantCountryName)
                        }
                    }
                    
                    // Reload table view to reflect changes
                    DispatchQueue.main.async {
                        self.tableView?.reloadData()
                    }
                }
            }
        }
    }
}

extension WantListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of country names
        return countryNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
        
        // Configure cell with country name and flag
        let countryName = countryNames[indexPath.row]
        let flagEmoji = CountryFlagProvider.getFlagEmoji(for: countryName)
        
        // Set cell text with country name and flag
        cell.textLabel?.text = "\(flagEmoji) \(countryName)"
        
        // Increase font size
        cell.textLabel?.font = UIFont.systemFont(ofSize: 28) // Adjust the size as needed
        
        return cell
    }

}

extension WantListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Remove the country name from the array
            let deletedCountryName = countryNames.remove(at: indexPath.row)
            // Update UI
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            // Perform deletion from Firestore
            guard let currentUserUID = Auth.auth().currentUser?.uid else { return }
            let userCountryRef = db.collection("users").document(currentUserUID).collection("countries")
            
            // Find the document corresponding to the deleted country name
            userCountryRef.whereField("wantCountryName", isEqualTo: deletedCountryName).getDocuments { (snapshot, error) in
                if let error = error {
                    print("Error retrieving document for deletion: \(error)")
                } else {
                    guard let document = snapshot?.documents.first else { return }
                    // Delete the document from Firestore
                    userCountryRef.document(document.documentID).delete { error in
                        if let error = error {
                            print("Error deleting document: \(error)")
                        } else {
                            print("Document successfully deleted")
                        }
                    }
                }
            }
        }
    }
}

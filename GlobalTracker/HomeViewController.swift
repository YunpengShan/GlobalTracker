import UIKit
import MapKit
import FirebaseFirestore
import FirebaseAuth

class HomeViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var visitedCountriesLabel: UILabel!
    
    let db = Firestore.firestore()
    
    let countryCoordinates: [String: CLLocationCoordinate2D] = [
        "Canada": CLLocationCoordinate2D(latitude: 56.1304, longitude: -106.3468),
        "China": CLLocationCoordinate2D(latitude: 35.8617, longitude: 104.1954),
        "Argentina": CLLocationCoordinate2D(latitude: -38.4161, longitude: -63.6167),
        "Japan": CLLocationCoordinate2D(latitude: 36.2048, longitude: 138.2529)
        // Add more countries and their coordinates here...
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        setupRealTimeCountryListener()
    }
    
    func setupRealTimeCountryListener() {
        guard let currentUserUID = Auth.auth().currentUser?.uid else {
            print("User not logged in")
            return
        }
        
        let userCountriesRef = db.collection("users").document(currentUserUID).collection("countries")
        
        userCountriesRef.addSnapshotListener { [weak self] (snapshot, error) in
            guard let self = self else { return }
            
            if let error = error {
                print("Error getting documents: \(error)")
            } else if let snapshot = snapshot {
                self.mapView.removeAnnotations(self.mapView.annotations)  // Remove all existing pins
                var countriesVisitedCount = 0
                
                for document in snapshot.documents {
                    let data = document.data()
                    if let visitedCountryName = data["visitedCountryName"] as? String {
                        self.addPinForCountry(named: visitedCountryName)
                        countriesVisitedCount += 1
                    }
                }

                // Update the visited countries count label
                DispatchQueue.main.async {
                    self.visitedCountriesLabel.text = "\(countriesVisitedCount)/195 countries visited"
                }
            }
        }
    }
    
    func addPinForCountry(named country: String) {
        if let coordinates = CountryCoordinateProvider.getCoordinates(for: country) {
            let pin = MKPointAnnotation()
            pin.coordinate = coordinates
            pin.title = country
            DispatchQueue.main.async {
                self.mapView.addAnnotation(pin)
            }
        } else {
            print("Coordinates not found for \(country)")
        }
    }
    
    // Implement MKMapViewDelegate methods if needed to customize pin views
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        // Customization of pins if required
//        // You can customize annotation views here if needed
//    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else { return nil }
        
        let identifier = "CountryPin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if pinView == nil {
            pinView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            pinView?.canShowCallout = true // To show the country name when the pin is tapped
        } else {
            pinView?.annotation = annotation
        }

        if let countryName = annotation.title ?? "" {
            let flagEmoji = CountryFlagProvider.getFlagEmoji(for: countryName)
            pinView?.image = imageFromEmoji(flagEmoji, size: CGSize(width: 40, height: 40))
        }
        return pinView
    }

    func imageFromEmoji(_ emoji: String, size: CGSize) -> UIImage? {
        let nsString = NSString(string: emoji)
        let font = UIFont.systemFont(ofSize: size.height)
        let stringAttributes = [NSAttributedString.Key.font: font]
        
        let imageSize = nsString.size(withAttributes: stringAttributes)
        
        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0)
        nsString.draw(in: CGRect(origin: CGPoint.zero, size: imageSize), withAttributes: stringAttributes)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }


}

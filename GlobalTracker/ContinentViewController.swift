import UIKit

class Continent {
    let name: String
    let imageName: String
    let nameImageName: String

    init(name: String, imageName: String, nameImageName: String) {
        self.name = name
        self.imageName = imageName
        self.nameImageName = nameImageName
    }
}

class ContinentViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!

    let reuseIdentifier = "Cell"
    var continents = [Continent]()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        continents = [
                    Continent(name: "Africa", imageName: "africa 1", nameImageName: "AFRICA 2"),
                    Continent(name: "Asia", imageName: "asia 1", nameImageName: "ASIA 2"),
                    Continent(name: "Europe", imageName: "europe 1", nameImageName: "EUROPE 2"),
                    Continent(name: "North America", imageName: "northAmerica 2", nameImageName: "NORTH AMERICA"),
                    Continent(name: "Oceania", imageName: "ociania 1", nameImageName: "OCEANIA"),
                    Continent(name: "South America", imageName: "southAmerica 1", nameImageName: "SOUTH AMERICA")
                ]

        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return continents.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        let continent = continents[indexPath.item]

        cell.continentImageView.image = UIImage(named: continent.imageName)
        cell.nameImageView.image = UIImage(named: continent.nameImageName)
        
        return cell
    }
}

extension ContinentViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height: CGFloat = 120 // Adjust the height as needed
        return CGSize(width: width, height: height)
    }
}

//
//  CellViewController.swift
//  GlobalTracker
//
//  Created by AndreShan on 2024-03-20.
//

import UIKit

class ContinentViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!

    let reuseIdentifier = "Cell"
    let images = ["africa", "asia", "europe", "northAmerica 1", "ociania", "southAmerica"]

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        let imageName = images[indexPath.item]
        cell.imageView.image = UIImage(named: imageName)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

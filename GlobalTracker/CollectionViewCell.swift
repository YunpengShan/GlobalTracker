import UIKit

class CollectionViewCell: UICollectionViewCell {
    let continentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(continentImageView)
        addSubview(nameImageView)

        NSLayoutConstraint.activate([
            continentImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            continentImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            continentImageView.widthAnchor.constraint(equalToConstant: 80), // Fixed width for the image
            continentImageView.heightAnchor.constraint(equalTo: continentImageView.widthAnchor), // Aspect ratio 1:1
            
            nameImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameImageView.leadingAnchor.constraint(equalTo: continentImageView.trailingAnchor, constant: 8),
            nameImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            nameImageView.heightAnchor.constraint(equalTo: continentImageView.heightAnchor)
        ])
    }
}

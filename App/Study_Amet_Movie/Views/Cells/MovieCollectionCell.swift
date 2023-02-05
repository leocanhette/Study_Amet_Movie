import Kingfisher
import UIKit

// MARK: - Initializer
final class MovieCollectionCell: UICollectionViewCell, Reusable {
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraint()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

// MARK: - Internal Methods
extension MovieCollectionCell {
    func setup(viewModel: MovieViewModeling) {
        if let posterURL = viewModel.posterURL {
            posterImageView.kf.setImage(with: posterURL)
        } else {
            posterImageView.image = UIImage(named: "no_image_available")
        }
    }
}


// MARK: - Private Methods
private extension MovieCollectionCell {
    func setupConstraint() {
        addSubview(posterImageView, constraints: [
            posterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            posterImageView.topAnchor.constraint(equalTo: topAnchor),
            posterImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

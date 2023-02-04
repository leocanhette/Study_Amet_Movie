import UIKit

// MARK: - Initializer
final class MovieCollectionCell: UICollectionViewCell, Reusable {
    private lazy var posterPathImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraint()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    
    func setup(_ posterPath: String) {
        
    }
}


// MARK: - Private Methods
private extension MovieCollectionCell {
    func setupConstraint() {
        addSubview(posterPathImageView, constraints: [
            posterPathImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            posterPathImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            posterPathImageView.topAnchor.constraint(equalTo: topAnchor),
            posterPathImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

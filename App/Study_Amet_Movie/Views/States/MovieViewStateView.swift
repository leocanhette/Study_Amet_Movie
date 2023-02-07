import UIKit

// MARK: - Initializer
final class MovieViewStateView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()        
        label.font = .boldSystemFont(ofSize: 26)
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.axis = .vertical
        stackView.spacing = Space.base05
        return stackView
    }()
    
    
    init(viewState: MovieViewState) {
        super.init(frame: .zero)
        
        setupConstraint()
        setup(viewState: viewState)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}



// MARK: - Internal Methods
extension MovieViewStateView {
    func setup(viewState: MovieViewState) {
        titleLabel.text = viewState.title
        subtitleLabel.text = viewState.subtitle
    }
}



// MARK: - Private Methods
private extension MovieViewStateView {
    func setupConstraint() {
        addSubview(stackView, constraints: [
            stackView.topAnchor.constraint(
                equalTo: topAnchor, constant: Space.base05),
            stackView.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: Space.base03).priority(.defaultLow),
            stackView.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -Space.base03),
            stackView.bottomAnchor.constraint(
                equalTo: bottomAnchor, constant: -Space.base03).priority(.defaultLow)
        ])
        
        titleLabel.centerXAnchor.constraint(
            equalTo: centerXAnchor).priority(.defaultHigh).isActive = true
        
        subtitleLabel.centerXAnchor.constraint(
            equalTo: centerXAnchor).isActive = true
    }
}

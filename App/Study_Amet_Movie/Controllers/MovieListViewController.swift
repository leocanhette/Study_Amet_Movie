import UIKit

// MARK: - Initializer
final class MovieListViewController: UIViewController {
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = Constants.MovieList.searchBarPlaceHolder
        searchBar.delegate = self
        return searchBar
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(
            top: 0, left: Space.base01, bottom: 0, right: Space.base01)
        let collectionView = UICollectionView(
            frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.bounces = false
        collectionView.isHidden = true
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private let stateView = MovieViewStateView(viewState: .initial)
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [collectionView, stateView])
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var dataSource = MovieListDataSource(
        collectionView: collectionView, cellsPerRow: 2)
    
    private lazy var searchUseCase = GetMovieSearchUseCase(
        gateway: gateway,
        presenter: self)
    
    private let gateway: MovieGateway
    
    init(gateway: MovieGateway) {
        self.gateway = gateway
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}



// MARK: - Lifecycles
extension MovieListViewController {
    override func loadView() {
        super.loadView()
        
        setupConstraint()
        setupLayout()
        
        hideKeyboardWhenTappedAround()
    }
}



// MARK: - Private Methods
private extension MovieListViewController {
    func setupConstraint() {
        view.addSubview(searchBar, constraints: [
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: Space.base01),
            searchBar.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -Space.base01),
        ])
        
        view.addSubview(stackView, constraints: [
            stackView.topAnchor.constraint(
                equalTo: searchBar.bottomAnchor, constant: Space.base02),
            
            stackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: Space.base02),
            
            stackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -Space.base02),
            
            stackView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Space.base02)
        ])
    }
    
    func setupLayout() {
        view.backgroundColor = .white
    }
    
    func showCollectionView(_ show: Bool) {
        stateView.isHidden = show
        collectionView.isHidden = !show
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(
            target: self, action: #selector(UIInputViewController.dismissKeyboard)
        )
        view.addGestureRecognizer(tap)
    }
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
}



// MARK: - Extension UISearchBarDelegate
extension MovieListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            searchUseCase.searchMovieByName(searchString: text)
            searchBar.resignFirstResponder()
        }
    }
}



// MARK: - Extension MovieListPresenter
extension MovieListViewController: MovieListPresenter {
    func show(movies: [MovieViewModeling]) {
        dataSource.setup(movies: movies)
        showCollectionView(true)
    }
    
    func show(error: MovieError) {
        stateView.setup(viewState: .error(description: error.errorDescription))
        showCollectionView(false)
    }
    
    func showEmpty() {
        stateView.setup(viewState: .empty)
        showCollectionView(false)
    }
}

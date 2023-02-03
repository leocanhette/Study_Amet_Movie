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
        let collectionView = UICollectionView(
            frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true
        return collectionView
    }()
    
    private let stateView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal
        
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [collectionView, stateView])
        stackView.axis = .vertical
        return stackView
    }()
    
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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: stateView.update(state: .initial)
    }
    
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
        collectionView.isHidden = !show
        stateView.isHidden = show
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
    func show(movies: [Movie]) {
        // TODO: dataSource.update(movies: movies)
        
        print("Filmes: \(movies.count)")
        showCollectionView(true)
    }
    
    func show(error: MovieError) {
        // TODO: stateView.update(state: .error(error.errorDescription))
        
        print("Error: \(error.errorDescription)")
        showCollectionView(false)
    }
    
    func showEmpty() {
        // TODO: stateView.update(state: .empty)
        
        print("###  Empty  ###")
        showCollectionView(false)
    }
}

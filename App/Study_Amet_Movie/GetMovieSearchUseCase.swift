// MARK: - Initializer
final class GetMovieSearchUseCase {
    private let gateway: MovieGateway
    private unowned let presenter: MovieListPresenter
    private var page = 1
    
    init(gateway: MovieGateway, presenter: MovieListPresenter) {
        self.gateway = gateway
        self.presenter = presenter
    }
    
    func searchPopularMovies() {
        presenter.showLoading()
        
        gateway.searchPopularMovies(page: page) { [weak self] result in
            switch result {
            case .success(let result):
                self?.onSuccess(result)
            case .failure(let error):
                self?.onFailure(error)
            }
        }
    }
    
    func searchMovieByName(searchString: String) {
        presenter.showLoading()
        
        gateway.searchMovieByTitle(queryString: searchString, page: page) { [weak self] result in
            switch result {
            case .success(let result):
                self?.onSuccess(result)
            case .failure(let error):
                self?.onFailure(error)
            }
        }
    }
}


// MARK: - Extension GetMovieSearchUseCase
private extension GetMovieSearchUseCase {
    func onSuccess(_ result: MovieResult) {
        if !result.movies.isEmpty {
            presenter.show(movies: result.movies.map(MovieViewModel.init))
        } else {
            presenter.showEmpty()
        }
        
        presenter.removeLoading()
    }
    
    func onFailure(_ error: MovieError) {
        presenter.show(error: error)
        presenter.removeLoading()
    }
}

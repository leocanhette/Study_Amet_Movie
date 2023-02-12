@testable import Study_Amet_Movie

final class MovieListPresenterSpy: MovieListPresenter {
    private(set) var invokedShowMoviesCount = 0
    func show(movies: [MovieViewModeling]) {
        invokedShowMoviesCount += 1
    }
    
    private(set) var invokedShowErrorCount = 0
    private(set) var errorReceived = [MovieError]()
    func show(error: MovieError) {
        invokedShowErrorCount += 1
        errorReceived.append(error)
    }
    
    private(set) var invokedShowEmptyCount = 0
    func showEmpty() {
        invokedShowEmptyCount += 1
        
    }
    
    private(set) var invokedShowLoadingCount = 0
    func showLoading() {
        invokedShowLoadingCount += 1
    }
    
    private(set) var invokedRemoveLoadingCount = 0
    func removeLoading() {
        invokedRemoveLoadingCount += 1
    }
}

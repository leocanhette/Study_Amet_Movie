@testable import Study_Amet_Movie

// MARK: - Initializer
final class MovieGatewayMock {
    private(set) var invokedSearchMovieByTitleCount = 0
    private(set) var stubbedSearchMovieCompletionResult: MovieCompletionResult?
    
    init(result: MovieResult) {
        stubbedSearchMovieCompletionResult = .success(result)
    }
    
    init(error: MovieError) {
        stubbedSearchMovieCompletionResult = .failure(error)
    }
}


// MARK: - Extension MovieGateway
extension MovieGatewayMock: MovieGateway {
    func searchMovieByTitle(queryString: String, page: Int, completion: @escaping CompletionHandler) {
        invokedSearchMovieByTitleCount += 1
        
        if let result = stubbedSearchMovieCompletionResult {
            completion(result)
        }
    }
    
    func searchPopularMovies(page: Int, completion: @escaping CompletionHandler) {
        // TODO
    }
}

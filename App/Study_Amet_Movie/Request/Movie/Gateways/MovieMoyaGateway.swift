import Moya

// MARK: - Initializer
final class MovieMoyaGateway {
    private let provider = MoyaProvider<MovieService>()
}


// MARK: - Extension MovieGateway
extension MovieMoyaGateway: MovieGateway {
    func searchPopularMovies(page: Int, completion: @escaping CompletionHandler) {
        provider.request(.searchPopularMovies(page: page)) { [weak self] moyaResult in
            guard let self = self else { return }
            
            let result: MovieCompletionResult
            
            switch moyaResult {
            case .success(let response):
                result = self.evaluateData(response.data)
                
            case .failure(let error):
                result = .failure(.error(description: error.localizedDescription))
            }
            
            completion(result)
        }
    }
    
    func searchMovieByTitle(queryString: String, page: Int, completion: @escaping CompletionHandler) {
        provider.request(.searchMovieByName(queryString, page: page)) { [weak self] moyaResult in
            guard let self = self else { return }
            
            let result: MovieCompletionResult
            
            switch moyaResult {
            case .success(let response):
                result = self.evaluateData(response.data)
                
            case .failure(let error):
                result = .failure(.error(description: error.localizedDescription))
            }
            
            completion(result)
        }
    }
}


// MARK: - Private Methods
private extension MovieMoyaGateway {
    func evaluateData(_ data: Data) -> MovieCompletionResult {
        if let requestError = evaluateError(data) {
            return .failure(requestError)
        }
        
        do {
            let dataDecoded = try JSONDecoder().decode(MovieResult.self, from: data)
            return .success(dataDecoded)
        } catch {
            return .failure(.parsingJSONResponse)
        }
    }
    
    
    func evaluateError(_ data: Data) -> MovieError? {
        if let dataDecoded = try? JSONDecoder().decode(MovieResultFailure.self, from: data) {
            return .error(description: dataDecoded.message)
        }
        
        return nil
    }
}

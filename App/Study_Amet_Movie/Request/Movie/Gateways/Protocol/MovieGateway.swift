protocol MovieGateway {
    typealias MovieCompletionResult = Result<MovieResult>
    typealias CompletionHandler = (MovieCompletionResult) -> Void
    
    func searchPopularMovies(page: Int, completion: @escaping CompletionHandler)
    func searchMovieByTitle(queryString: String, page: Int, completion: @escaping CompletionHandler)
}

import Moya

// MARK: - Initializer
enum MovieService {
    case searchPopularMovies(page: Int)
    case searchMovieByName(_ queryString: String, page: Int)
}

// MARK: - Extension TargetType
extension MovieService: Moya.TargetType {
    var baseURL: URL {        
        guard let url = URL(string: R.string.apI.baseURL()) else {
            fatalError(R.string.error.invalidBaseURL())
        }

        return url
    }
    
    var path: String {
        switch self {
        case .searchPopularMovies:
            return R.string.apI.searchPopularMoviesPath()
        case .searchMovieByName:
            return R.string.apI.searchMovieByNamePath()
        }
    }
    
    var method: Method {
        switch self {
        case .searchPopularMovies,
             .searchMovieByName:
            return .get
        }
    }
        
    var task: Task {
        switch self {
        case .searchPopularMovies(let page):
            return .requestParameters(
                parameters: [
                    "api_key": R.string.apI.apiKey(),
                    "language": R.string.apI.language(),
                    "page": page
                ],
                encoding: URLEncoding.default)
        case .searchMovieByName(let queryString, let page):
            return .requestParameters(
                parameters: [
                    "api_key": R.string.apI.apiKey(),
                    "language": R.string.apI.language(),
                    "page": page,
                    "query": queryString
                ],
                encoding: URLEncoding.default)
        }
    }

    var sampleData: Data { Data() }
    
    var headers: [String : String]? { nil }
}

import Moya

// MARK: - Initializer
enum MovieService {
    case searchPopularMovies(page: Int)
    case searchMovieByName(_ queryString: String, page: Int)
}

// MARK: - Extension TargetType
extension MovieService: Moya.TargetType {
    var baseURL: URL {
        guard let url = URL(string: Constants.API.baseURL) else {
            fatalError("baseURL could not be configured.")
        }

        return url
    }
    
    var path: String {
        switch self {
        case .searchPopularMovies:
            return Constants.API.searchPopularMoviesPath
        case .searchMovieByName:
            return Constants.API.searchMovieByNamePath
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
                    "api_key": Constants.API.apiKey,
                    "language": Constants.API.language,
                    "page": page
                ],
                encoding: URLEncoding.default)
        case .searchMovieByName(let queryString, let page):
            return .requestParameters(
                parameters: [
                    "api_key": Constants.API.apiKey,
                    "language": Constants.API.language,
                    "page": page,
                    "query": queryString
                ],
                encoding: URLEncoding.default)
        }
    }

    var sampleData: Data { Data() }
    
    var headers: [String : String]? { nil }
}

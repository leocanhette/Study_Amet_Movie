import Foundation

enum MovieError: LocalizedError {
    case parsingJSONResponse
    case error(description: String)
    
    var errorDescription: String {
        switch self {
        case .parsingJSONResponse:
            return Constants.Error.parsingJSONResponse
        case .error(let description):
            return description
        }
    }
}

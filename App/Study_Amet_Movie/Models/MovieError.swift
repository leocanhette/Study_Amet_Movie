import Foundation

enum MovieError: LocalizedError {
    case parsingJSONResponse
    case error(description: String)
    
    var errorDescription: String {
        switch self {
        case .parsingJSONResponse:
            return R.string.error.parsingJSONResponse()
        case .error(let description):
            return description
        }
    }
}

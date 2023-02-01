struct MovieResult {
    let page: Int
    let totalPages: Int
    let movies: [Movie]
}

// MARK: - Extension Decodable
extension MovieResult: Decodable {
    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case movies = "results"
    }
}

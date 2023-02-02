struct Movie {
    let id: Int
    let posterPath: String?
}

// MARK: - Extension Decodable
extension Movie: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
    }
}

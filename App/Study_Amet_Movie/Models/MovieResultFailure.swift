struct MovieResultFailure {
    let message: String
}

// MARK: - Extension Decodable
extension MovieResultFailure: Decodable {
    enum CodingKeys: String, CodingKey {
        case message = "status_message"
    }
}

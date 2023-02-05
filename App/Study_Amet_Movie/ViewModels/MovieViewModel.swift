import Foundation

// MARK: - Protocol
protocol MovieViewModeling {
    var id: Int { get }
    var posterURL: URL? { get }
    
    init(from model: Movie)
}


// MARK: - Initializer
struct MovieViewModel {
    private let model: Movie
    
    init(from model: Movie) {
        self.model = model
    }
}


// MARK: - Extension MovieViewModeling
extension MovieViewModel: MovieViewModeling {
    var id: Int { model.id }
    
    var posterURL: URL? {
        if let posterPath = model.posterPath,
           let posterURL = URL(string: Constants.API.baseURLPosterImage + posterPath) {
            return posterURL
        }
        return nil
    }
}

enum Constants {
    enum API {
        static let apiKey = "f350a5f7c3ef3d8e9235fcbe68ce665c"
        static let language = "pt-BR"
        static let baseURL = "https://api.themoviedb.org/3"
        
        static let searchPopularMoviesPath = "/movie/popular"
        static let searchMovieByNamePath = "/search/movie"
        
        static let baseURLPosterImage = "https://image.tmdb.org/t/p/w154"        
    }
    enum Error {
        static let parsingJSONResponse = "Received different JSON structure response."
    }
    
    enum MovieList {
        static let viewControllerTitle = "Filmes"
        static let searchBarPlaceHolder = "Pesquisar pelo título do filme"
    }
}

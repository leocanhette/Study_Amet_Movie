@testable import Study_Amet_Movie

extension MovieResult {
    static func fixture(
        page: Int = 0,
        totalPages: Int = 0,
        movies: [Movie] = []
    ) -> Self {
        .init(page: page, totalPages: totalPages, movies: movies)
    }
}

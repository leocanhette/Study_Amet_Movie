@testable import Study_Amet_Movie

extension Movie {
    static func fixture(
        id: Int = 0,
        posterPath: String? = nil
    ) -> Self {
        .init(id: id,posterPath: posterPath)
    }
}

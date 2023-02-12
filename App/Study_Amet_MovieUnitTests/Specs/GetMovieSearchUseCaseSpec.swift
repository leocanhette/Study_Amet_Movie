import Quick
import Nimble

@testable import Study_Amet_Movie

// MARK: - Initializer
final class GetMovieSearchUseCaseSpec: QuickSpec {
    var gatewayMock: MovieGatewayMock!
    var presenterSpy: MovieListPresenterSpy!
    
    var sut: GetMovieSearchUseCase!
    
    let searchString = "play"
    
    var result: MovieResult {
        gatewayMock.stubbedSearchMovieCompletionResult?.associatedValue() as! MovieResult
    }
}


// MARK: - Private Methods
private extension GetMovieSearchUseCaseSpec {
    func setupMovies() {
        let movieResult = MovieResult.fixture(
            movies: [.fixture(id: 1, posterPath: "posterPath")]
        )
        
        gatewayMock = MovieGatewayMock(result: movieResult)
        presenterSpy = MovieListPresenterSpy()
        
        sut = GetMovieSearchUseCase(
            gateway: gatewayMock,
            presenter: presenterSpy)
    }
    
    func setupEmptyMovies() {
        gatewayMock = MovieGatewayMock(result: MovieResult.fixture())
        presenterSpy = MovieListPresenterSpy()
        
        sut = GetMovieSearchUseCase(
            gateway: gatewayMock,
            presenter: presenterSpy)
    }
    
    func setupErrorMovies() {
        gatewayMock = MovieGatewayMock(error: .error(description: "Teste"))
        presenterSpy = MovieListPresenterSpy()
        
        sut = GetMovieSearchUseCase(
            gateway: gatewayMock,
            presenter: presenterSpy)
    }
}


// MARK: - Spec
extension GetMovieSearchUseCaseSpec {
    override func spec() {
        super.spec()
        describe("GetMovieSearchUseCaseSpec") {
            context("when did type a text and send it") {
                context("with movies found") {
                    beforeEach {
                        self.setupMovies()
                        self.sut?.searchMovieByName(searchString: self.searchString)
                    }
                    
                    it("should call presenter method of show loading only once") {
                        expect(self.presenterSpy.invokedShowLoadingCount).to(equal(1))
                    }
                    
                    it("should call gateway method of searchMovieByTitle only once") {
                        expect(self.gatewayMock.invokedSearchMovieByTitleCount).to(equal(1))
                    }
                    
                    it("shoud call presenter method of show movies only once") {
                        expect(self.presenterSpy.invokedShowMoviesCount).to(equal(1))
                    }
                    
                    it("should call presenter method of remove loading only once") {
                        expect(self.presenterSpy.invokedRemoveLoadingCount).to(equal(1))
                    }
                    
                    it("shouldn't call presenter method of show empty") {
                        expect(self.presenterSpy.invokedShowEmptyCount).to(equal(0))
                    }
                    
                    it("shouldn't call presenter method of show error") {
                        expect(self.presenterSpy.invokedShowErrorCount).to(equal(0))
                    }
                    
                    it("should have the movies with the follows values") {
                        expect(self.result.movies[0].id).to(equal(1))
                        expect(self.result.movies[0].posterPath).to(equal("posterPath"))
                    }
                }
                
                // MARK: - Movies not found
                context("movies not found") {
                    beforeEach {
                        self.setupEmptyMovies()
                        self.sut?.searchMovieByName(searchString: self.searchString)
                    }
                    
                    it("should call presenter method of show loading only once") {
                        expect(self.presenterSpy.invokedShowLoadingCount).to(equal(1))
                    }
                    
                    it("should call method of show empty only once") {
                        expect(self.presenterSpy.invokedShowEmptyCount).to(equal(1))
                    }
                    
                    it("should call presenter method of remove loading only once") {
                        expect(self.presenterSpy.invokedRemoveLoadingCount).to(equal(1))
                    }
                    
                    it("shouldn't have movies") {
                        expect(self.result.movies.isEmpty).to(equal(true))
                    }
                }
            }
            
            // MARK: - Failure Response
            context("when did type a text and send it and is failure response") {
                beforeEach {
                    self.setupErrorMovies()
                    self.sut?.searchMovieByName(searchString: self.searchString)
                }
                
                it("should call presenter method of show loading only once") {
                    expect(self.presenterSpy.invokedShowLoadingCount).to(equal(1))
                }
                
                it("should call presenter method of show error") {
                    expect(self.presenterSpy.invokedShowErrorCount).to(equal(1))
                }
                
                it("should call presenter method of remove loading only once") {
                    expect(self.presenterSpy.invokedRemoveLoadingCount).to(equal(1))
                }
                
                it("shouldn't call presenter method of show movies") {
                    expect(self.presenterSpy.invokedShowMoviesCount).to(equal(0))
                }
                
                it("shouldn't call presenter method of show empty") {
                    expect(self.presenterSpy.invokedShowEmptyCount).to(equal(0))
                }
                
                it("should have the Error with the following description") {
                    expect(self.presenterSpy.errorReceived).to(equal([MovieError.error(description: "Teste")]))
                }
            }
        }
    }
}

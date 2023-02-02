import UIKit

@main
class SceneDelegate: UIResponder, UIWindowSceneDelegate, UIApplicationDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        self.window = window
        
        window.rootViewController = TesteViewController()
        window.makeKeyAndVisible()
    }
}


class TesteViewController: UIViewController {
    private let gateway: MovieGateway = MovieMoyaGateway()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        searchPopularMovies()
        searchMovieByName()
    }
    
    func searchPopularMovies() {
        gateway.searchPopularMovies(page: 1) { result in
            switch result {
            case .success(let result):
                print("Result: \(result.movies.count)")
            case .failure(let error):
                print("Error: \(error.errorDescription)")
            }
        }
    }
    
    func searchMovieByName() {
        let queryString = "Senhor Aneis"
        gateway.searchMovieByTitle(queryString: queryString, page: 1) { result in
            switch result {
            case .success(let result):
                print("Result: \(result.movies.count)")
            case .failure(let error):
                print("Error: \(error.errorDescription)")
            }
        }
    }
}

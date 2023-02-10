import UIKit

// MARK: - Initializer
final class MovieListCoordinator {
    private lazy var viewController: MovieListViewController = {
        let viewController = MovieListViewController(gateway: gateway)
        viewController.title = R.string.movieList.viewControllerTitle()
        return viewController
    }()
    
    private let navigationController: UINavigationController
    private let gateway: MovieGateway
    
    init(navigationController: UINavigationController, gateway: MovieGateway) {
        self.navigationController = navigationController
        self.gateway = gateway
    }
}


// MARK: - Extension Coordinator
extension MovieListCoordinator: Coordinator {
    func start() {
        navigationController.pushViewController(viewController, animated: true)
    }
}

import UIKit

// MARK: - Initializer
final class MovieListCoordinator {
    private let navigationController: UINavigationController
    private let gateway: MovieGateway
    
    private lazy var viewController: UIViewController = {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .white
        viewController.title = Constants.MovieList.viewControllerTitle
        return viewController
    }()
    
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

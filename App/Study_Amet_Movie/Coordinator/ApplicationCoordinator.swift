import UIKit

// MARK: - Initializer
final class ApplicationCoordinator {
    private let window: UIWindow
    private let gateway: MovieGateway
    private let rootNavigationController: UINavigationController
    
    init(window: UIWindow, gateway: MovieGateway) {
        self.window = window
        self.gateway = gateway
        rootNavigationController = UINavigationController()
        
        setupNavigationView()
    }
    
    private func setupNavigationView() {
        rootNavigationController.navigationBar.prefersLargeTitles = true
    }
}


// MARK: - Extension Coordinator
extension ApplicationCoordinator: Coordinator {
    func start() {
        window.rootViewController = rootNavigationController
        window.makeKeyAndVisible()
        
        MovieListCoordinator(navigationController: rootNavigationController, gateway: gateway).start()
    }
}

import UIKit

protocol LoadingPresenter: AnyObject {
    func showLoading()
    func removeLoading()
}

extension LoadingPresenter where Self: UIViewController {
    func showLoading() {
        view.load()
    }
    
    func removeLoading() {
        view.unload()
    }
}

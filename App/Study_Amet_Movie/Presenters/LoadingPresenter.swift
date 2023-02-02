import UIKit

protocol LoadingPresenter: AnyObject {
    func showLoading()
    func removeLoading()
}

extension LoadingPresenter where Self: UIViewController {
    func showLoading() {
        print("###   Loading   ###")
    }
    
    func removeLoading() {
        print("###   Remove Loading   ###")
    }
}

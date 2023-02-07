import UIKit

extension UIView {
    func addSubview<T: UIView>(_ view: T, constraints: [NSLayoutConstraint]) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(view)
        
        NSLayoutConstraint.activate(constraints)
    }
}

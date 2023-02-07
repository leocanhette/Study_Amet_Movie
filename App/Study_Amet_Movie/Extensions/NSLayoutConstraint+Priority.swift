import UIKit

extension NSLayoutConstraint {
    func priority(_ value: UILayoutPriority) -> NSLayoutConstraint {
        priority = value
        
        return self
    }
}

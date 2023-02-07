import UIKit

extension UIView {
    func load() {
        let lockView = UIView(frame: bounds)
        lockView.backgroundColor = UIColor(white: 0.0, alpha: 0.75)
        lockView.alpha = 0.0
        lockView.tag = 999
        
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.color = .white
        activityIndicator.hidesWhenStopped = true
        activityIndicator.center = lockView.center
        activityIndicator.startAnimating()
        
        addSubview(lockView)
        
        lockView.addSubview(activityIndicator, constraints: [
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        UIView.animate(withDuration: 0.2) {
            lockView.alpha = 1.0
        }
    }
    
    func unload() {
        if let lockView = viewWithTag(999) {
            UIView.animate(withDuration: 0.2, animations: {
                lockView.alpha = 0.0
            }) { _ in
                lockView.removeFromSuperview()
            }
        }
    }
}

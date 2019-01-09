//
//  SKActivityIndicatorProtocol.swift
//  SimpleKit
//
//  Created by Amr Omran on 01/05/2019.
//

import UIKit

public protocol SKActivityIndicatorProtocol {
    
    func setLoadingIndicator(_ set: Bool)
}

public extension SKActivityIndicatorProtocol where Self : UIViewController {
    
    /**
     setLoadingIndicator create UIActivityIndicatorView.
     - Parameter set: Bool.
     */
    func setLoadingIndicator(_ set: Bool) {
        
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.center = self.view.center
        activityIndicator.isHidden = true
        
        if set {
            activityIndicator.startAnimating()
            activityIndicator.isHidden = false
            self.view.addSubview(activityIndicator)

        } else {
            activityIndicator.isHidden = true
            DispatchQueue.main.async {
              activityIndicator.stopAnimating()
            }
            
            activityIndicator.removeFromSuperview()
        }
    }

}

//
//  SKActivityIndicatorProtocol.swift
//  SimpleKit
//
//  Created by Amr Omran on 01/05/2019.
//

import UIKit

public protocol SKActivityIndicatorProtocol {
    
    func setLoadingIndicator(activityIndicator: UIActivityIndicatorView, activate: Bool)
}

public extension SKActivityIndicatorProtocol where Self : UIViewController {
    
    /**
     setLoadingIndicator create UIActivityIndicatorView.
     - Parameter set: Bool.
     */
    func setLoadingIndicator(activityIndicator: UIActivityIndicatorView, activate: Bool) {
        
        activityIndicator.center = self.view.center
        activityIndicator.isHidden = true
        
        if activate {
            activityIndicator.startAnimating()
            activityIndicator.isHidden = false
            self.view.addSubview(activityIndicator)

        } else {
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
        }
    }

}

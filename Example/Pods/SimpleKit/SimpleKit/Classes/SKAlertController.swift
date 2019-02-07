//
//  SKAlertController.swift
//  Pods
//
//  Created by Amr Omran on 12/23/2018.
//

import UIKit

public protocol SKAlertController {
    
    /**
     Creates simple UIAlertController.
     - Parameter title: String.
     - Parameter msg: String.
     - Parameter actionTitle: String.
     */
    func showSimpleAlert(title: String?, msg: String?, actionTitle: String)
}

public extension SKAlertController where Self : UIViewController {
    
    /**
     Creates simple UIAlertController.
     - Parameter title: String.
     - Parameter msg: String.
     - Parameter actionTitle: String.
     */
    func showSimpleAlert(title: String?, msg: String?, actionTitle: String) {
        let ac: UIAlertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action: UIAlertAction = UIAlertAction(title: actionTitle, style: .default, handler: nil)
        ac.addAction(action)
        self.present(ac, animated: true, completion: nil)
    }

}

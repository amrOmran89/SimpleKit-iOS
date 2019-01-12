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
     */
    func showSimpleAlert(title: String?, msg: String?)
}

public extension SKAlertController where Self : UIViewController {
    
    /**
     Creates simple UIAlertController.
     - Parameter title: String.
     - Parameter msg: String.
     */
    func showSimpleAlert(title: String?, msg: String?) {
        let ac: UIAlertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action: UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        ac.addAction(action)
        self.present(ac, animated: true, completion: nil)
    }

}

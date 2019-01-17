//
//  UIViewExtenstion.swift
//  SimpleKit
//
//  Created by Amr Omran on 01/05/2019.
//

import UIKit

public extension UIView {
    
    func animateShowPopUpView(parentView: UIView) {
        self.alpha = 0
        
        UIView.animate(
            withDuration: 2,
            delay: 0,
            options: [.curveEaseOut],
            animations: {
                self.alpha = 1.0
                self.center.y -= parentView.bounds.height - 100
                parentView.layoutIfNeeded()
            },
            completion: nil
        )
        
    }
    
    func animateHide() {
        UIView.animate(
            withDuration: 2,
            delay: 0,
            options: [.curveLinear],
            animations: {
                self.center.y += self.bounds.height
            },
            completion: {(_ completed: Bool) -> Void in
                
            }
        )
    }
}

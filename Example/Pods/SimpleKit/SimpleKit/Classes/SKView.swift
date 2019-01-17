//
//  SKView.swift
//  SimpleKit
//
//  Created by Amr Omran on 01/05/2019.
//

import Foundation

protocol SKView {
    func showView()
}

extension SKView where Self : UIViewController {
    

    
    func showView() {
        let showUpView: UIView = {
            let point = CGPoint(x: 0.0, y: 0.0)
            let size = CGSize(width: 100, height: 100)
            let view = UIView(frame: CGRect(origin: point, size: size))
            view.backgroundColor = .gray
            return view
        }()
        
        self.view.addSubview(showUpView)
    }
    
}

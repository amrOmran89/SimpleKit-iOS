//
//  SKPopUpViewController.swift
//  SimpleKit
//
//  Created by Amr Omran on 01/05/2019.
//

import UIKit

public class SKPopUpViewController: UIViewController {
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        self.providesPresentationContextTransitionStyle = true
        self.definesPresentationContext = true
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        self.view.addSubview(customView)
        
        customView.animateShowPopUpView(parentView: self.view)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }
    
    deinit {
        print("SKPopUpViewController deinitialized")
    }
    
    
    var customView: UIView {
        let maxY: CGFloat = self.view.frame.maxY - 320
        let centerX: CGFloat = self.view.frame.midX

        let point = CGPoint(x: centerX, y: maxY)
        let size = CGSize(width: 270, height: 300)
        let rect = CGRect(origin: point, size: size)

        let customView = UIView(frame: rect)
        customView.backgroundColor = .yellow
        customView.layer.cornerRadius = 15
        return customView
    }
    
}



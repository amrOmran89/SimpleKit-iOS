//
//  ViewController.swift
//  SimpleKit
//
//  Created by amr.omraan@icloud.com on 01/07/2019.
//  Copyright (c) 2019 amr.omraan@icloud.com. All rights reserved.
//

import UIKit
import SimpleKit

class ViewController: UIViewController, SKActivityIndicatorProtocol {

    let indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setLoadingIndicator(activityIndicator: indicator, activate: true)
        
    }


    @IBAction func button(_ sender: Any) {
        print(InternetChecker.isInternetAvailable)
        setLoadingIndicator(activityIndicator: indicator, activate: false)
    }
    
}


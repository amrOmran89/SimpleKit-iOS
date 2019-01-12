//
//  ViewController.swift
//  SimpleKit
//
//  Created by amr.omraan@icloud.com on 01/07/2019.
//  Copyright (c) 2019 amr.omraan@icloud.com. All rights reserved.
//

import UIKit
import SimpleKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }


    @IBAction func button(_ sender: Any) {
        print(InternetChecker.isInternetAvailable)
    }
    
}


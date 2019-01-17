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

    let indicator = UIActivityIndicatorView(style: .gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setLoadingIndicator(activityIndicator: indicator, activate: true)
        
    }


    @IBAction func button(_ sender: Any) {
        print(InternetChecker.isInternetAvailable)
        setLoadingIndicator(activityIndicator: indicator, activate: false)
        
        ClientService.HTTPRequest(baseURL: "https://reqres.in",
                                  path: "/api/users",
                                  httpMethod: .delete,
                                  headers: nil,
                                  parameter: nil)
            .build { (result: Data) in
                print(result.createdAt)
        }

    }
    
}

struct Data: Decodable {

    let name: String
    let job: String
    let id: String
    let createdAt: String
}

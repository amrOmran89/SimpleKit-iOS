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
        
        
        ClientService.HTTPRequest(baseURL: "https://reqres.in",
                                  path: "/api/users/2",
                                  httpMethod: .get)
            .build { (result: Response) in
                print(result.data.first_name)
            }
//        
//        ClientService.HTTPRequest(baseURL: <#T##String#>,
//                                  path: <#T##String#>,
//                                  httpMethod: <#T##SKHttpMethod#>,
//                                  queryItems: <#T##Queries?#>,
//                                  headers: <#T##Dictionary<String, String>?#>,
//                                  parameter: <#T##Parameters?#>)
    }
    
}

struct Data: Decodable {
    let id: Int
    let first_name: String
    let last_name: String
    let avatar: String
}

struct Response: Decodable {
    let data: Data
}

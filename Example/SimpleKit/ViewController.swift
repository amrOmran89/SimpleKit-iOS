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

    let indicator = UIActivityIndicatorView(style: .gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func button(_ sender: Any) {
    
        
        NetworkService.HTTPClient
            .init(baseURL: "https://reqres.in")
            .withPath("/api/users")
            .withMethod(.get)
            .withQueries(queries: [URLQueryItem(name: "page", value: "2")])
            .build { (result: Response) in
                print(result.data.first?.avatar)
            }
        
    }
    
}

struct Response: Codable {
    let page: Int
    let per_page: Int
    let total: Int
    let total_pages: Int
    let data: [Data]
}

struct Data: Codable {
    let id: Int
    let first_name: String
    let last_name: String
    let avatar: String
}


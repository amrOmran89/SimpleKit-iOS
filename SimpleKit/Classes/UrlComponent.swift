//
//  UrlComponent.swift
//  NetworkDependency
//
//  Created by Amr Omran on 12/01/2018.
//  Copyright © 2018 Amr Omran. All rights reserved.
//

import Foundation

public protocol UrlComponent {
    
    var simpleUrlComponent: URLComponents { get }
    var urlComponentWithQueries: URLComponents { get }
}


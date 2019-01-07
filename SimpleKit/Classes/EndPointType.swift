//
//  EndPointType.swift
//  NetworkDependency
//
//  Created by Amr Omran on 11/17/2018.
//  Copyright © 2018 Amr Omran. All rights reserved.
//

import Foundation

public typealias Queries = Array<URLQueryItem>
public typealias Parameters = Dictionary<String, Any>

public protocol SKEndPointType {
    
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: SKHttpMethod { get }
    var httpHeaders: Dictionary<String, String>? { get }
    var queryItems: Queries? { get }
    var parameter: Parameters? { get }
}

//
//  NetworkError.swift
//  NetworkDependency
//
//  Created by Amr Omran on 11/17/2018.
//  Copyright © 2018 Amr Omran. All rights reserved.
//

import Foundation

enum RequestError: Error{
    
    case wrongUrl
    case requestError
    case response
    case wrongUrlComponents
    case parameterError
}

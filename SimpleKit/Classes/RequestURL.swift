//
//  RequestURL.swift
//  NetworkDependency
//
//  Created by Amr Omran on 11/17/2018.
//  Copyright © 2018 Amr Omran. All rights reserved.
//

import Foundation

public protocol SKRequestURL {
    
    /// build GET Request
    var request: URLRequest { get }
    
    /// build any request with parameter and headers (Delete, Put, Post, Patch)
    var requestWithParameterAndHeader: URLRequest { get }
}



public extension SKRequestURL where Self: ClientService.HTTPRequest {
    
    var urlComponents: URLComponents {
        get {
            guard let url = URL(string: self.baseURL) else { fatalError(Constants.wrongUrl) }
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
            components?.path = self.path
            return components!
        }
        set {}
    }
    
    
    /// build GET Request
    var request: URLRequest {
        var req: URLRequest!
        
        if let queries = self.queryItems {
            var urlComponet = urlComponents
            urlComponet?.queryItems = queries
            
            guard let url = urlComponents?.url else { fatalError(Constants.wrongUrlComponents) }
            print("URL: \(url)")
            
            req = URLRequest(url: url)
            req.httpMethod = httpMethod.rawValue
            return req
        }
        guard let url = urlComponents?.url else { fatalError(Constants.wrongUrlComponents) }
        print("URL: \(url)")
        req = URLRequest(url: url)
        return req
    }
    
    
    
    /// build any request with parameter and headers (Delete, Put, Post, Patch)
    var requestWithParameterAndHeader: URLRequest {
        urlComponents?.queryItems = self.queryItems
        
        guard let url = urlComponents?.url else { fatalError(Constants.wrongUrlComponents) }
        print("URL: \(url)")
        
        var req: URLRequest = URLRequest(url: url)
        req.httpMethod = self.httpMethod.rawValue
        req.addValue(SKHttpHeaders.application_json, forHTTPHeaderField: SKHttpHeaders.content_type)
        req.allHTTPHeaderFields = self.httpHeaders
        
        do {
            guard let para = self.parameter else { fatalError(Constants.parameterError) }
            req.httpBody = try JSONSerialization.data(withJSONObject: para, options: [])
        } catch let error {
            print(error)
        }
        return req
    }
    
}

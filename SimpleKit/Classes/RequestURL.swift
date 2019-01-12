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
    
    
    /// build GET Request
    var request: URLRequest {
        
        var req: URLRequest!
        
        guard let url = URL(string: self.baseURL) else { fatalError(Constants.wrongUrl) }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        components?.path = self.path
        
        if let queries = self.queryItems {
           
            components?.queryItems = queries
            let componentsUrl = components?.url
           
            print("URL: \(componentsUrl!)")
            
            req = URLRequest(url: componentsUrl!)
            return req
        }
        
        guard let componentsUrl = components?.url else { fatalError(Constants.wrongUrl) }

        req = URLRequest(url: componentsUrl)
        return req
    }
    
    
    
    /// build any request with parameter and headers (Delete, Put, Post, Patch)
    var requestWithParameterAndHeader: URLRequest {
        
        guard let url = URL(string: self.baseURL) else { fatalError(Constants.wrongUrl) }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.path = self.path
        guard let componentsUrl = components?.url else { fatalError(Constants.wrongUrl) }
        
        var req: URLRequest = URLRequest(url: componentsUrl)
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

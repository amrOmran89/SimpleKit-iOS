//
//  RequestURL.swift
//  NetworkDependency
//
//  Created by Amr Omran on 11/17/2018.
//  Copyright © 2018 Amr Omran. All rights reserved.
//

import Foundation

protocol RequestURL {
    
    /// build GET Request
    func request() throws -> URLRequest
    
    /// build any request with parameter and headers such as (Delete, Put, Post, Patch)
    func requestWithParameterAndHeader() throws -> URLRequest
}


extension RequestURL where Self: NetworkManager.HTTPClient {
    
    /// build GET Request
    func request() throws -> URLRequest {
        
        guard let url = URL(string: self.baseURL) else { throw RequestError.wrongUrl }
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
            else { throw RequestError.wrongUrlComponents }
        
        if let path = self.path {
            components.path = path
        }
        if let queries = self.queryItems {
            components.queryItems = queries
        }
        guard let urlComponent = components.url else { throw RequestError.requestError }
        return URLRequest(url: urlComponent)
    }
    
    
    /// build any request with parameter and headers such as (Delete, Put, Post, Patch)
    func requestWithParameterAndHeader() throws -> URLRequest {
        
        guard let url = URL(string: self.baseURL) else { throw RequestError.wrongUrl }
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
            else { throw RequestError.wrongUrlComponents }
        
        if let path = self.path {
            components.path = path
        }
       
        guard let urlComponent = components.url else { throw RequestError.requestError }
        
        var request: URLRequest = URLRequest(url: urlComponent)
        request.httpMethod = self.httpMethod.rawValue
        request.allHTTPHeaderFields = self.httpHeaders
        
        do {
            if let para = self.parameter {
                request.httpBody = try JSONSerialization.data(withJSONObject: para, options: [])
            }
        } catch let error {
            print(error)
        }
        return request
    }


}

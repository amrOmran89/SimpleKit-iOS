//
//  Controller.swift
//  NetworkDependency
//
//  Created by Amr Omran on 11/17/2018.
//  Copyright © 2018 Amr Omran. All rights reserved.
//

import Foundation


public class ClientService: FileSystemProtocol {
    
    public init() {}
    
    
    public class HTTPRequest: SKEndPointType, SKRequestURL {
        
        public var baseURL: String
        public var path: String
        public var httpHeaders: Dictionary<String, String>?
        public var httpMethod: SKHttpMethod
        public var queryItems: Queries?
        public var parameter: Parameters?
        
        public init(baseURL: String, path: String,
                    httpMethod: SKHttpMethod,
                    queryItems: Queries? = nil,
                    headers: Dictionary<String, String>? = nil,
                    parameter: Parameters? = nil) {
            
            self.baseURL = baseURL
            self.path = path
            self.httpMethod = httpMethod
            self.httpHeaders = headers
            self.queryItems = queryItems
            self.parameter = parameter
        }
        
        var urlComponents: URLComponents? {
            get {
                guard let url = URL(string: self.baseURL) else { fatalError(Constants.wrongUrl) }
                var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
                components?.path = self.path
                return components!
            }
            set {}
        }
        
        
        public func buildRequestForJson<T: Decodable>(_ callback: @escaping (T?, Error?) -> Void) {
            
            let session = URLSession.shared
            var urlRequest: URLRequest!
            
            switch self.httpMethod {
            case .get:
                urlRequest = self.request
            default:
                urlRequest = self.requestWithParameterAndHeader
            }
            
            guard let httpRequest = urlRequest else { fatalError(Constants.requestError) }
            
            let task = session.dataTask(with: httpRequest) { (data, respone, error) in
                if let err = error {
                    print(err)
                    callback(nil, error)
                }
                else {
                    let responseStatus = respone as! HTTPURLResponse
                    print("\(Constants.response) \(responseStatus.statusCode)")
                    
                    do {
                        if let data = data {
                            let jsonData = try JSONDecoder().decode(T.self, from: data)
                            
                            callback(jsonData, nil)
                        }
                    }
                    catch let error {
                        print(error.localizedDescription)
                        callback(nil, error)
                    }
                }
            }
            task.resume()
        }
    }
    

   
    public func downloadFile(urlString: String, fileName: String, callback: @escaping (URL?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }

        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        let task = session.downloadTask(with: url) { (tempURL, response, error) in
            
            if error != nil {
                print(error!.localizedDescription)
                callback(nil, error)
            } else {
                let fileManager = FileManager.default
                let fileUrl = self.fileLocalUrl(fileName: fileName)
                
                do {
                    try fileManager.copyItem(at: tempURL!, to: fileUrl)
                    if fileManager.fileExists(atPath: fileUrl.path) {
                        
                        callback(fileUrl, nil)
                    }
                } catch let error {
                    print(error.localizedDescription)
                    callback(nil, error)
                }
            }
        }
        task.resume()
    }
    
    
    public func loadImage(urlString: String, callback: @escaping (UIImage?, Error?) -> Void) {
        let imageCache = NSCache<AnyObject, UIImage>()

        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            
            if let err = error {
                print(err.localizedDescription)
                callback(nil, err)
            }
            else {
                _ = response as! HTTPURLResponse
                
                DispatchQueue.main.async {
                    
                    guard let data = data else { return }
                    if let downloadedImage: UIImage = UIImage(data: data) {
                        
                        imageCache.setObject(downloadedImage, forKey: url as AnyObject)
                        
                        callback(downloadedImage, nil)
                        
                    }
                }
            }
        }
        task.resume()
    }
    
    
}


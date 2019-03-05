//
//  Controller.swift
//  NetworkDependency
//
//  Created by Amr Omran on 11/17/2018.
//  Copyright © 2018 Amr Omran. All rights reserved.
//

import Foundation


public class NetworkManager: FileSystemProtocol, URLDownloadable {
    
    public init() {}
    
    public class HTTPClient: EndPointType, RequestURL {
        
        var baseURL: String
        var path: String?
        var httpHeaders: Header?
        var httpMethod: SKHttpMethod = SKHttpMethod.get
        var queryItems: Queries?
        var parameter: Parameters?
        
        public init(baseURL: String) {
            self.baseURL = baseURL
        }
        
        public func withPath(_ path: String) -> HTTPClient {
            self.path = path
            return self
        }
        
        public func withMethod(_ method: SKHttpMethod) -> HTTPClient {
            self.httpMethod = method
            return self
        }
        
        public func withQueries(queries: Queries) -> HTTPClient {
            self.queryItems = queries
            return self
        }
        
        public func withHeaders(header: Header) -> HTTPClient {
            self.httpHeaders = header
            return self
        }
        
        public func build<T: Decodable>(callback: @escaping (T) -> Void) {
            let session = URLSession.shared
            var urlRequest: URLRequest?
            
            switch self.httpMethod {
                case .get:
                    do {
                        try urlRequest = self.request() // request() may throws an error because of the url
                    } catch let error {
                        print(error.localizedDescription)
                    }
                default:
                    do {
                        try urlRequest = self.requestWithParameterAndHeader() // may throws an error because of the url
                    } catch let error {
                        print(error.localizedDescription)
                    }
            }
            
            guard let httpRequest = urlRequest else { return }
            
            let task = session.dataTask(with: httpRequest) { (data, respone, error) in
                if let err = error {
                    print(err)
                }
                else {
                    let responseStatus = respone as! HTTPURLResponse
                    print("Response Code: \(responseStatus.statusCode)")
                    
                    do {
                        if let data = data {
                            let jsonData = try JSONDecoder().decode(T.self, from: data)
                            
                            callback(jsonData)
                        }
                    } catch let error {
                        print(error.localizedDescription)
                    }
                }
            }
            task.resume()
        }
    }
    

   
    /// use this method to download files
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
    
    
    /// use this method to load images from API to UIImageView
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


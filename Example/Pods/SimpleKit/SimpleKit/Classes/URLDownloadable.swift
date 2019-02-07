//
//  URLDownloadProtocol.swift
//  SimpleKit
//
//  Created by Amr Omran on 01/12/2019.
//

import UIKit

public protocol URLDownloadable {
    
    func loadImage(urlString: String, callback: @escaping (UIImage?, Error?) -> Void)
    func downloadFile(urlString: String, fileName: String, callback: @escaping (URL?, Error?) -> Void)
    
}

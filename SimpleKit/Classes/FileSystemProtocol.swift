//
//  FIleSystemProtocol.swift
//  SimpleKit
//
//  Created by Amr Omran on 01/04/2019.
//

import Foundation

public protocol FileSystemProtocol {
    
    func fileLocalUrl(fileName: String) -> URL
}

public extension FileSystemProtocol {
    func fileLocalUrl(fileName: String) -> URL {
        let file = FileManager.default
        let documents: URL = file.urls(for: .documentDirectory, in: .userDomainMask).first!
        let destinationUrl = documents.appendingPathComponent(fileName)
        return destinationUrl
    }
}

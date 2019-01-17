//
//  SKError.swift
//  SimpleKit
//
//  Created by Amr Omran on 01/05/2019.
//

import Foundation

enum SKError: Error {
    case coreMLError
    case unknownError
    case connectionError
    case invalidCredentials
    case invalidRequest
    case notFound
    case invalidResponse
    case serverError
    case serverUnavailable
    case timeOut
    case unsuppotedURL
}

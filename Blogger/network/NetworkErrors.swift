//
//  NetworkErrors.swift
//  Blogger
//
//  Created by Prabhakar Patil on 24/10/20.
//

import Foundation

public enum NetworkError: Error {
    
    case apiError
    case invalidEndPoint
    case invalidResponse
    case noData
    case decodeError
}


extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .apiError:
            return "The API failed to load the data"
        case .invalidEndPoint:
            return "Invalid Endpoint requested"
        case .invalidResponse:
            return "Response received for the request is invalid"
        case .noData:
            return "Request returned no data"
        case .decodeError:
            return "Failed to decode the data"
        }
    }
}

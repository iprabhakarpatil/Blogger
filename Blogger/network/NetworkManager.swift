//
//  NetworkManager.swift
//  Blogger
//
//  Created by Prabhakar Patil on 24/10/20.
//

import Foundation
import UIKit

class NetworkService {
    
    private var BASE_URL = "https://5e99a9b1bc561b0016af3540.mockapi.io/jet2/api/v1/blogs?limit=10&page="
    
    public static let shared = NetworkService()
    private init() {}
    private let urlSession = URLSession.shared
    
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        return jsonDecoder
    }()
    
    // MARK:- Service Calls
    
    
    /// Generic function to fetch and decode the data
    /// - Parameters:
    ///   - url: URL
    ///   - completion: @escaping (Result<T, NetworkError>) -> Void)
    private func fetchData<T: Codable>(url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        guard let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            completion(.failure(.invalidEndPoint))
            return
        }
        
        guard let url = urlComponents.url else {
            completion(.failure(.invalidEndPoint))
            return
        }
        
        urlSession.dataTask(with: url) { (result) in
            switch result {
            case .success(let (response, data)):
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                    completion(.failure(.invalidResponse))
                    return
                }
                do {
                    let values = try self.jsonDecoder.decode(T.self, from: data)
                    completion(.success(values))
                } catch {
                    completion(.failure(.decodeError))
                }
            case .failure(_):
                completion(.failure(.apiError))
            }
        }.resume()
    }
    
    
    /// Fetch blogs for the  page number
    /// - Parameters:
    ///   - page: Int
    ///   - result: @escaping (Result<T, NetworkError>) -> Void
    public func fetchBlogs<T: Codable>(for page: Int, result: @escaping (Result<T, NetworkError>) -> Void) {
        let url = BASE_URL + "\(page)"
        let blogsURL = URL(string: url)!.absoluteURL
        print("URl:\(blogsURL)")
        fetchData(url: blogsURL, completion: result)
    }
    
}


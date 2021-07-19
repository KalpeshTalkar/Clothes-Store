//
//  APIService.swift
//  Clothes Store
//
//  Created by Kalpesh on 18/07/21.
//  Copyright © 2021 RichieHope. All rights reserved.
//

import Foundation

public enum HTTPRequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

/// The base service class all the service requests.
/// All other services should inherit this base APIService.
class APIService {

    private let session: URLSession = URLSession.shared

    typealias ServiceCompletion = (_ data: Data?, _ response: HTTPURLResponse?, _ error: StoreError?) -> Void

    /// Execute service request.
    /// - Parameters:
    ///   - endPoint: Endpoint of the service.
    ///   - method: HTTPRequestMethod
    ///   - headers: (Optional) Headers required for the service.
    ///   - queryParams: (Optional) Url query parameters.
    ///   - body: (Optional) Request body parameters.
    ///   - completion: Completion block.
    func executeRequest(endPoint: String, method: HTTPRequestMethod, headers: [String : String]? = nil, queryParams: [String : Any]? = nil, body: [String : Any]? = nil, completion: ServiceCompletion? = nil) {

        guard let url = URL(string: endPoint) else {
            completion?(nil, nil, StoreError.invalidUrlError())
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        let headers = headers ?? [:]
        headers.forEach { (key, value) in
            request.setValue(value, forHTTPHeaderField: key)
        }

        if let queryParams = queryParams {
            var queryItems = [URLQueryItem]()
            queryParams.forEach { (key, value) in
                let strValue = (value as? String) ?? "\(value)"
                queryItems.append(URLQueryItem(name: key, value: strValue))
            }

            var urlComponents = URLComponents(string: url.absoluteString)
            urlComponents?.queryItems = queryItems

            request.url = urlComponents?.url
        }

        if let body = body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }

        session.dataTask(with: request) { (data, response, error) in
            let response = response as? HTTPURLResponse

            var serviceError: StoreError? = nil
            if let error = error {
                serviceError = StoreError(message: error.localizedDescription, code: response?.statusCode)
            }

            DispatchQueue.main.async {
                completion?(data, response, serviceError)
            }

        }.resume()
    }
}

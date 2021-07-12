//
//  DataService.swift
//  Clothes Store
//
//  Created by Richard Hope on 01/05/2021.
//  Copyright © 2021 Deloitte. All rights reserved.
//

import Foundation
import Alamofire

class DataService {
    
    class func getProducts(completion: @escaping (Products?, Error?) -> Void) {
        
        let requestUrl = URLCall.catalogue.rawValue
        
        AF.request(requestUrl,
                   method: .get,
                   encoding: JSONEncoding.default).responseDecodable(of: Products.self){ response in
                    
                    switch response.result {
                    case .success:
                        
                        guard let data = response.data else{return}
                        
                        let products = try? JSONDecoder().decode(Products.self, from: data)
                        completion(products, nil)
                        
                    case .failure(let error):
                        completion(nil, error)
                    }
                   }
    }
}

// MARK: - Alamofire response handlers

extension AlamofireExtension {
    func newJSONDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
            decoder.dateDecodingStrategy = .iso8601
        }
        return decoder
    }
}

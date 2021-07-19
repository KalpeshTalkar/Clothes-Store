//
//  DataService.swift
//  Clothes Store
//
//  Created by Richard Hope on 01/05/2021.
//  Copyright © 2021 Deloitte. All rights reserved.
//

import Foundation

class DataService: APIService {

    func getProducts(completion: @escaping (Products?, StoreError?) -> Void) {
        let requestUrl = URLCall.catalogue.rawValue
        executeRequest(endPoint: requestUrl, method: .get) { data, response, error in
            let products = data?.map(to: Products.self)
            completion(products, error)
        }
    }
}

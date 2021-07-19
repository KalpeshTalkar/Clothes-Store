//
//  StoreError.swift
//  Clothes Store
//
//  Created by Kalpesh on 18/07/21.
//  Copyright © 2021 RichieHope. All rights reserved.
//

import Foundation

public struct StoreError: LocalizedError {

    let message: String?
    let code: Int?

    public var errorDescription: String? {
        return message
    }

    public var failureReason: String? {
        return message
    }

    public static func genericError() -> StoreError {
        return StoreError(message: "Oops! Something is not right. Please try again later.", code: 900)
    }

    static func invalidUrlError() -> StoreError {
        return StoreError(message: "Invalid URL.", code: 902)
    }
}



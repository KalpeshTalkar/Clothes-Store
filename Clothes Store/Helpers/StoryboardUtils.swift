//
//  StoryboardUtils.swift
//  Clothes Store
//
//  Created by Kalpesh on 12/07/21.
//  Copyright © 2021 RichieHope. All rights reserved.
//

import UIKit

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

/// StoryboardIdentifiable global conformance
extension UIViewController: StoryboardIdentifiable { }

enum Storyboard: String {
    case main

    var filename: String {
        return rawValue.capitalized
    }
}


extension UIStoryboard {

    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.filename, bundle: bundle)
    }

    /// Get UIViewController instance with the identifier
    /// - parameter identifier: Identifier of the view controller given in storyboard
    /// - returns: New instance of UIViewController with the provided id
    func viewController(for identifier: String) -> UIViewController {
        return instantiateViewController(withIdentifier: identifier)
    }

    /// Get type casted UIViewController instance with the identifier
    /// - parameter type: Type of the UIViewController
    /// - returns: New instance of UIViewController with the provided id
    func viewController<T: UIViewController>(of type: T.Type) -> T {
        guard let viewController =  viewController(for: T.storyboardIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }
        return viewController
    }
}

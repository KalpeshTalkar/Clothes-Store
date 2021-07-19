//
//  CatalogueDetail.swift
//  Clothes Store
//
//  Created by Kalpesh on 18/07/21.
//  Copyright © 2021 RichieHope. All rights reserved.
//

import SwiftUI
import UIKit

@available(iOS 14.0, *)
struct CatalogueDetail: UIViewControllerRepresentable {

    let product: Product

    func makeUIViewController(context: UIViewControllerRepresentableContext<CatalogueDetail>) -> UINavigationController {
        let detailVC = UIStoryboard(storyboard: .main).viewController(of: DetailViewContainerViewController.self)
        let navigationVC = UINavigationController(rootViewController: detailVC)
        detailVC.product = product
        return navigationVC
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: UIViewControllerRepresentableContext<CatalogueDetail>) {
    }
}

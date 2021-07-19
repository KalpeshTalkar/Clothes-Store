//
//  ProductView.swift
//  Clothes Store
//
//  Created by Kalpesh on 12/07/21.
//  Copyright © 2021 RichieHope. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct ProductView: View {

    var product: Product
    @State private (set) var showProductDetail: Bool = false

    var body: some View {
        GeometryReader { reader in
            ZStack {
                VStack(alignment: .leading) {
                    if let imageURL = URL(string: product.image ?? "") {
                        AsyncImage(
                            url: imageURL,
                            placeholder: {
                                Image("placeholderImage")
                                    .resizable()
                            },
                            image: {
                                Image(uiImage: $0).resizable()
                            }
                        )
                        .cornerRadius(10)
                        .padding(.bottom, 8)
                        
                    } else {
                        Image("placeholderImage")
                            .resizable()
                            .cornerRadius(10)
                            .padding(.bottom, 8)
                    }

                    Text(product.name ?? "")
                        .font(.body)
                        .foregroundColor(Color(UIColor.lightGray.cgColor))
                        .padding(.bottom, 8)

                    Text(CurrencyHelper.getMoneyString(product.price ?? 0))
                        .font(.title2)
                        .foregroundColor(Color(UIColor.darkGray.cgColor))
                }
                .padding(15)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
            }
            .padding(15)
            .background(Color.clear)
            .onTapGesture {
                Haptic.feedBack()
                showProductDetail = true
            }
            .sheet(isPresented: $showProductDetail) {
                CatalogueDetail(product: product)
            }
        }
    }
}

@available(iOS 14.0, *)
struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(product: Product(productId: "123", name: "Dummy", category: nil, price: 7.99, stock: 3, oldPrice: 10.15, image: nil))
    }
}

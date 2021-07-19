//
//  CatalogueView.swift
//  Clothes Store
//
//  Created by Kalpesh on 12/07/21.
//  Copyright © 2021 RichieHope. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct CatalogueView: View {

    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]

    private let columns = Array(
        repeating: GridItem(.flexible(), spacing: 0),
            count: 2
        )

    @State var products: [Product] = []
    @State private (set) var showErrorAlert: Bool = false
    @State private (set) var showLoader: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                if showLoader {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    ScrollView {
                        LazyVGrid(columns: gridItemLayout) {
                            ForEach(0..<products.count) { i in
                                ProductView(product: products[i])
                                    .frame(height: 250)
                            }
                        }
                        .padding(15)
                    }
                }
            }
            .onAppear {
                print("on appear")
                getProducts()
            }
            .alert(isPresented: $showErrorAlert) {
                Alert(title: Text("Error"), message: Text("There has been an error getting the data. Please check your network connection and try again"), dismissButton: .default(Text("Retry"), action: {
                    getProducts()
                }))
            }
            .navigationTitle("Catalogue")
        }
    }

    private func getProducts() {
        showLoader = true
        DataService.getProducts { (products, error) in
            self.showLoader = false
            if error != nil {
                self.showErrorAlert = true
            } else {
                self.products = products?.products ?? []
            }
        }
    }

}

@available(iOS 14.0, *)
struct CatalogueView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogueView()
    }
}

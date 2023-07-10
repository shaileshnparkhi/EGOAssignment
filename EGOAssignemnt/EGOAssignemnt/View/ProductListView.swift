//
//  ProductListReusableView.swift
//  EDG iOS Test
//
//  Created by Shailesh on 09/07/23.
//

import SwiftUI

struct ProductListView: View {
    @EnvironmentObject var viewModel:ProductListViewModel
    @State var isActive = true
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.productsList ?? [], id: \.?.id){ product in
                    
                    NavigationLink(destination: ProductDetailsView(product:product), label: {
                        ProductListReusableView(product:product)
                    })
                    
                    
                }
            }.buttonStyle(PlainButtonStyle())
                .listStyle(GroupedListStyle()).navigationTitle("Products")
        }
    }
    }

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}

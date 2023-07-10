//
//  FavoriteList.swift
//  EDG iOS Test
//
//  Created by Shailesh on 09/07/23.
//

import SwiftUI

struct FavoriteList: View {
    @EnvironmentObject var viewModel:ProductListViewModel
    var body: some View {
        NavigationView{
        List{
            
            if viewModel.favoritedProductlist?.count == 0{
              
                Text("No Favorites").frame(width: UIScreen.main.bounds.width,height: 400)
                
            }else{
                ForEach(viewModel.favoritedProductlist ?? [], id: \.?.id){ product in
                
                    
                    NavigationLink(destination: ProductDetailsView(product:product)){
                        
                        ProductListReusableView(product:product)
                    }
                    
                }
            }
               

        }.navigationTitle("Favorites").buttonStyle(PlainButtonStyle())
                .listStyle(GroupedListStyle())
        
            
        }
            
        
    }
}

struct FavoriteList_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteList()
    }
}

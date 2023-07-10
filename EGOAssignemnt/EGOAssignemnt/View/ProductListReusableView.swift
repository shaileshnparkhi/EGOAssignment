//
//  ProductListReusableView.swift
//  EDG iOS Test
//
//  Created by Shailesh on 10/07/23.
//

import SwiftUI

struct ProductListReusableView: View {
    @EnvironmentObject var viewModel:ProductListViewModel
    var product:ProductsList?
    var body: some View {
        
          HStack{
              AsyncImage(url: URL(string: product?.imageURL ?? ""))
                  .frame(width:30, height: 30, alignment: .center).clipped()
              VStack{
                  Text(product?.title ?? "")
                  Text("$\(String(product?.saleUnitPrice ?? 0))").font(.system(size: 16)).foregroundColor(Color.green)
                
              }
            
              Spacer()
             
              Button(action: {
                  
                 
              }, label: {
                  Text("Add To Cart").foregroundColor(Color.white)
              }).background(Color.gray).frame(width: 100, height: 40).clipped().buttonStyle(BorderedButtonStyle()).font(.system(size: 12))
              
              Button(action: {
                  
                  let indexToGet = viewModel.productsList?.firstIndex(where: {$0?.id == product?.id})
                  
                  viewModel.productsList?[indexToGet ?? 0]?.isFavorite.toggle()
                  
                  
              }, label: {
                  let indexToGet = viewModel.productsList?.firstIndex(where: {$0?.id == product?.id})
                  
                  Image(viewModel.productsList?[indexToGet ?? 0]?.isFavorite ?? false ?  "mark_unfavorite_icon" : "mark_favorite_icon").frame(width: 30,height:30).fixedSize().scaledToFill().fixedSize(horizontal: true, vertical: true).clipped().tint(.blue)
                  
              })
          }
    }
}

struct ProductListReusableView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListReusableView()
    }
}

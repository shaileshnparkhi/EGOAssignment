//
//  ProductDetailsView.swift
//  EDG iOS Test
//
//  Created by Shailesh on 09/07/23.
//

import SwiftUI

struct ProductDetailsView: View {
    @EnvironmentObject var viewModel:ProductListViewModel
    var product:ProductsList?
    var body: some View {
        ScrollView{
            VStack{
                Text(product?.title ?? "")
                Spacer(minLength: 20)
                AsyncImage(url: URL(string: product?.imageURL ?? ""))
                    .frame(width:UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.width/2, alignment: .center).clipped()
                Spacer(minLength: 20)
                Text("$\(String(product?.saleUnitPrice ?? 0))").font(.title)
                HStack{
                  
                    Button(action: {
                        
                        let indexToGet = viewModel.productsList?.firstIndex(where: {$0?.id == product?.id})
                        
                        viewModel.productsList?[indexToGet ?? 0]?.isFavorite.toggle()
                        
                        
                    }, label: {
                        let indexToGet = viewModel.productsList?.firstIndex(where: {$0?.id == product?.id})
                        
                        Image(viewModel.productsList?[indexToGet ?? 0]?.isFavorite ?? false ?  "mark_unfavorite_icon" : "mark_favorite_icon").frame(width: 40,height:40).clipped().scaledToFit()
                        
                    })
                    HStack{
                        Text("Rating:")
                        Text(String(product?.ratingCount ?? 0))
                    }
                   
                }

            }
        }

    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView()
    }
}

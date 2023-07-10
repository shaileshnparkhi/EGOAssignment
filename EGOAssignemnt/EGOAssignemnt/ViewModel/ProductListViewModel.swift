//
//  ProductListViewModel.swift
//  EDG iOS Test
//
//  Created by Shailesh on 08/07/23.
//

import Foundation


class ProductListViewModel:ObservableObject{
    
    @Published var productsList:[ProductsList?]?{
        didSet{
            favoritedProductlist = productsList?.filter{$0?.isFavorite == true}
        }
    }
    @Published var favoritedProductlist:[ProductsList?]?
    
    func getProductData() {
        let utility = GetDataSourceUtility()
        utility.getProductData(url: URL(string: APIConstant.baseURL)!, resultType: ProductsResponse.self, completion: {result,error in
            if error == nil{
                DispatchQueue.main.async {
                    self.productsList = result?.productsList ?? []
                }
            }
        })
    }
}


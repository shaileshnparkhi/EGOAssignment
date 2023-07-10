//
//  ContentView.swift
//  EDG iOS Test
//
//  Created by Shailesh on 08/07/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = ProductListViewModel()
    @State var defaultOne = 1
    @State var alertMessage:String = ""
    @State var presentAlert:Bool = false
    var body: some View {
        NavigationView(content: {
            TabView{
                
                ProductListView().tabItem({
                    
                    Text("Products")
                    Image(systemName: "star")
                    }).tag(1)
                
                FavoriteList().tabItem({
                    
                    Text("Favorites")
                    Image(systemName: "heart")

                    }).tag(2)
                
            }.tint(.red)
        }).onAppear(perform: {
            viewModel.getProductData()
        }).environmentObject(viewModel).navigationTitle("Demo App").navigationViewStyle(StackNavigationViewStyle())
      

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

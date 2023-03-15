//
//  ContentView.swift
//  RecipeApp
//
//  Created by Kafui Kpoh on 13/03/2023.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeViewModel
    
    
    var body: some View {
        
        
        NavigationView {
            
            List(model.recipes) { r in
                NavigationLink(destination: RecipeDetailView(recipe: r), label: {
                    HStack(spacing: 20.0) {
                        Image(r.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50, alignment: .center)
                            .clipped()
                            .cornerRadius(5)
                        
                        Text(r.name)
                    }
                }) 
                
            }.navigationTitle("All Recipes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}

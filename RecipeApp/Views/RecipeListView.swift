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
            
            VStack (alignment: .leading) {
                
                Text("All Recipes")
                    .bold()
                    .font(Font.custom("Avenir Heavy", size: 24))
                    .padding(.top, 40)
                
                ScrollView {
                    LazyVStack (alignment: .leading) {
                        ForEach(model.recipes) { r in
                            NavigationLink(destination: RecipeDetailView(recipe: r), label: {
                                
                                // MARK: Row item
                                HStack(spacing: 20.0) {
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    
                                    VStack (alignment: .leading) {
                                        Text(r.name)
                                            .foregroundColor(.black)
                                            .font(Font.custom("Avenir Heavy", size: 16))
                                        
                                        RecipeHighlights(highlights: r.highlights)
                                            .foregroundColor(.gray)
                                    }
                                }
                            })
                            
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .padding(.leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeViewModel())
    }
}

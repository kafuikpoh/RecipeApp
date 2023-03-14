//
//  RecipeDetailView.swift
//  RecipeApp
//
//  Created by Kafui Kpoh on 14/03/2023.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                
                //MARK: Recipe Image
                
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                //MARK: Ingredients
                
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom, .top], 5.0)
                    
                    ForEach(recipe.ingredients, id: \.self){ item in
                        Text("• " + item)
                    }
                }
                .padding(.horizontal)
                
                //MARK: divider
                Divider()
                
                //MARK: Directions
                
                VStack(alignment: .leading){
                    
                    Text("Directions")
                        .font(.headline)
                        .padding(.bottom, 5.0)
                    
                    ForEach(0..<recipe.directions.count, id: \.self){ index in
                        Text(String(index + 1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5.0)
                    }
                        
                }
                .padding(.horizontal)
            }
            
        }.navigationBarTitle(recipe.name)
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        //dummy data
        let model = RecipeViewModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}

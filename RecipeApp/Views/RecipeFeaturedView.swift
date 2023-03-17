//
//  RecipeFeaturedView.swift
//  RecipeApp
//
//  Created by Kafui Kpoh on 15/03/2023.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeViewModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 0) {
            
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .font(Font.custom("Avenir Heavy", size: 24))
                .padding(.top, 40)
            
            GeometryReader{ geo in
                
                TabView (selection: $tabSelectionIndex) {
                    
                    ForEach (0..<model.recipes.count, id: \.self) { index in
                        
                        if model.recipes[index].featured == true {
                            
                            //recipe card button
                            Button(action: {
                                
                                self.isDetailViewShowing = true
                                
                            }, label: {
                                //recipe card
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    VStack(spacing: 0) {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .clipped()
                                            .aspectRatio(contentMode: .fill)
                                        
                                        Text(model.recipes[index].name)
                                            .padding(5)
                                            .font(Font.custom("Avenir", size: 15))
                                    }
                                }
                            })
                            .tag(index)
                            .sheet(isPresented: $isDetailViewShowing){
                                
                                // Show the recipe detail view
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                                .cornerRadius(20)
                                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                        }
                        
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack (alignment: .leading, spacing: 10) {
                Text("Preparation Time:")
                    .font(.headline)
                Text(model.recipes[tabSelectionIndex].prepTime)
                    .font(Font.custom("Avenir", size: 15))
                
                
                Text("Highlights")
                    .font(.headline)
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
                
            }.padding([.leading, .bottom])
        }
        .onAppear(perform: {
            setFeaturedIndex()
        })
    }
    
    func setFeaturedIndex(){
        
        // Find the index of first recipe that is featured
        var index = model.recipes.firstIndex{(recipe) ->  Bool in
            
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeViewModel())
    }
}

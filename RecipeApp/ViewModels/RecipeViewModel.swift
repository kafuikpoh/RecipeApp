//
//  RecipeViewModel.swift
//  RecipeApp
//
//  Created by Kafui Kpoh on 13/03/2023.
//

import Foundation

class RecipeViewModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init(){
        
        //create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
    }
}

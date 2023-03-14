//
//  DataService.swift
//  RecipeApp
//
//  Created by Kafui Kpoh on 13/03/2023.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        //parse local json file
        
        //get a url path to the file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // check if pathstring is not nil, otherwise...
        guard pathString != nil else {
            return [Recipe]()
        }
        
        //create url object
        let url = URL(fileURLWithPath: pathString!)
        
        do{
            //create data object
            let data = try Data(contentsOf: url)
            
            //decode the data with json decoder
            let decoder = JSONDecoder()
            
            do{
                
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                //add the unique IDs
                for r in recipeData {
                    r.id = UUID()
                }
                
                //return the recipes
                return recipeData
            }
            catch {
                print(error)
            }
            
        }
        catch {
            // error with getting data
            print(error)
        }
        
        return [Recipe]()
    }
}

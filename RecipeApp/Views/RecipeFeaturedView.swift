//
//  RecipeFeaturedView.swift
//  RecipeApp
//
//  Created by Kafui Kpoh on 15/03/2023.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeViewModel
    
    var body: some View {
        Text("featured view")
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
    }
}

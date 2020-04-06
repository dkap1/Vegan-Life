//
//  RecipeModel.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 03/04/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import Foundation

class RecipeModel: NSObject {
    var recipeid: String?
    var recipetitle: String?
    var recipekey: String?
    var recipeingredients: String?

    
    
    override init() {
        
    }
    init(recipeid: String, recipetitle: String, recipekey: String, recipeingredients: String) {
        self.recipeid = recipeid
        self.recipetitle = recipetitle
        self.recipekey = recipekey
        self.recipeingredients = recipeingredients
    }
    override var description: String {
        return "recipeid: \(recipeid), recipetitle: \(recipetitle), recipekey: \(recipekey), recipeingredients: \(recipeingredients)"
    }
}

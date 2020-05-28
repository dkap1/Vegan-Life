//
//  RecipeModel.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 03/04/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import Foundation

class RecipeModel: NSObject, NSCoding {
   
    var recipeid: String?
    var recipetitle: String?
    var recipekey: String?
    var recipeingredients: String?
    var recipeauthor: String?
    var recipeserving: String?
    var recipecookingtime: String?
    var recipenuts: String?
    var recipegf: String?
    var recipecategory: String?
 
    enum Keys: String {
      case recipeid = "recipeid"
      case recipetitle = "recipetitle"
      case recipekey = "recipekey"
      case recipeingredients = "recipeingredients"
      case recipeauthor = "recipeauthor"
      case recipeserving = "recipeserving"
      case recipecookingtime = "recipecookingtime"
      case recipecategory = "recipecategory"
      case recipenuts = "recipenuts"
      case recipegf = "recipegf"
    }

    
    override init() {
        
    }
    init(recipeid: String, recipetitle: String, recipekey: String, recipeingredients: String, recipeauthor: String, recipeserving: String, recipecookingtime: String, recipecategory: String, recipenuts: String, recipegf: String) {
        self.recipeid = recipeid
        self.recipetitle = recipetitle
        self.recipekey = recipekey
        self.recipeingredients = recipeingredients
        self.recipeauthor = recipeauthor
        self.recipeserving = recipeserving
        self.recipecookingtime = recipecookingtime
        self.recipecategory = recipecategory
        self.recipenuts = recipenuts
        self.recipegf = recipegf
        
    }
    override var description: String {
        return "recipeid: \(recipeid), recipetitle: \(recipetitle), recipekey: \(recipekey), recipeingredients: \(recipeingredients), recipeauthor: \(recipeauthor), recipeserving: \(recipeserving), recipecookingtime: \(recipecookingtime), recipecategory: \(recipecategory), recipenuts: \(recipenuts), recipegf: \(recipegf)"
    }
    required init(coder aDecoder: NSCoder) {
        recipeid = aDecoder.decodeObject(forKey: "recipeid") as? String ?? ""
        recipetitle = aDecoder.decodeObject(forKey: "recipetitle") as? String ?? ""
        recipekey = aDecoder.decodeObject(forKey: "recipekey") as? String ?? ""
        recipeingredients = aDecoder.decodeObject(forKey: "recipeingredients") as? String ?? ""
        recipeauthor = aDecoder.decodeObject(forKey: "recipeauthor") as? String ?? ""
        recipeserving = aDecoder.decodeObject(forKey: "recipeserving") as? String ?? ""
        recipecookingtime = aDecoder.decodeObject(forKey: "recipecookingtime") as? String ?? ""
        recipecategory = aDecoder.decodeObject(forKey: "recipecateogry") as? String ?? ""
        recipenuts = aDecoder.decodeObject(forKey: "recipenuts") as? String ?? ""
        recipegf = aDecoder.decodeObject(forKey: "recipegf") as? String ?? ""
        
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(recipeid, forKey: "recipeid")
        aCoder.encode(recipetitle, forKey: "recipetitle")
        aCoder.encode(recipekey, forKey: "recipekey")
        aCoder.encode(recipeingredients, forKey: "recipeingredients")
        aCoder.encode(recipeauthor, forKey: "recipeauthor")
        aCoder.encode(recipeserving, forKey: "recipeserving")
        aCoder.encode(recipecookingtime, forKey: "recipecookingtime")
        aCoder.encode(recipecategory, forKey: "recipecateogry")
        aCoder.encode(recipenuts, forKey: "recipenuts")
        aCoder.encode(recipegf, forKey: "recipegf")
      
        
    }
   override func isEqual(_ object: Any?) -> Bool {
       guard let rhs = object as? RecipeModel else { return false }
       return recipeid == rhs.recipeid && recipetitle == rhs.recipetitle && recipekey == rhs.recipekey  && recipeingredients == rhs.recipeingredients && recipeauthor == rhs.recipeauthor && recipeserving == rhs.recipeserving && recipecookingtime == rhs.recipecookingtime && recipecategory == rhs.recipecategory && recipenuts == rhs.recipenuts && recipegf == rhs.recipegf
   }

  
    
}

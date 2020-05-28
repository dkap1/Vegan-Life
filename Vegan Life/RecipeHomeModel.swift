//
//  RecipeHomeModel.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 03/04/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

protocol RecipeHomeModelProtocol: class {
    func itemsDownloaded(items: NSArray)
}

class RecipeHomeModel: NSObject, URLSessionDelegate {
    
    weak var delegate: RecipeHomeModelProtocol?
  //  var data = Data()
    let urlPath: String = "https://vegan-life.000webhostapp.com/recipeservice.php"
    
    func downloadItems() {
        let url: URL = URL(string: urlPath)!
       let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.ephemeral)
        URLCache.shared.removeAllCachedResponses()
        let task = defaultSession.dataTask(with: url){
            (data, response, error) in
            if error != nil {
                print("Failed to download data")
            }else{
                print("Data downloaded")
                self.parseJSON(data!)
            }
        }
        task.resume()
    }
    func parseJSON(_ data: Data){
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
        } catch let error as NSError {
            print(error)
            
        }
        var jsonElement = NSDictionary()
        let recipes = NSMutableArray()
        
        for i in 0 ..< jsonResult.count
          
        {
            jsonElement = jsonResult[i] as! NSDictionary
            let recipe = RecipeModel()
            
            if let recipeid = jsonElement["recipeid"] as? String,
            let recipetitle = jsonElement["recipetitle"] as? String,
            let recipekey = jsonElement["recipekey"] as? String,
            let recipeingredients = jsonElement["recipeingredients"] as? String,
            let recipeauthor = jsonElement["recipeauthor"] as? String,
            let recipeserving = jsonElement["recipeserving"] as? String,
                let recipecookingtime = jsonElement["recipecookingtime"] as? String,
            let recipecategory = jsonElement["recipecategory"] as? String,
            let recipenuts = jsonElement["recipenuts"] as? String,
            let recipegf = jsonElement["recipegf"] as? String
          
            {
                recipe.recipeid = recipeid
                recipe.recipetitle = recipetitle
                recipe.recipekey = recipekey
                recipe.recipeingredients = recipeingredients
                recipe.recipeauthor = recipeauthor
                recipe.recipeserving = recipeserving
                recipe.recipecookingtime = recipecookingtime
                recipe.recipecategory = recipecategory
                recipe.recipenuts = recipenuts
                recipe.recipegf = recipegf
             
                
                
            }
            
            recipes.add(recipe)
        }
        DispatchQueue.main.async(){
            self.delegate?.itemsDownloaded(items: recipes)
        }

    }
    
}



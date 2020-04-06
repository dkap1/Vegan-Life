//
//  ModelHomeClothing.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 01/04/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

protocol ModelHomeClothingProtocol: class {
    func itemsDownloaded(items: NSArray)
}

class ModelHomeClothing: NSObject, URLSessionDelegate {
    
    weak var delegate: ModelHomeClothingProtocol?
   // var data = Data()
    let urlPath: String = "https://vegan-life.000webhostapp.com/clothingfilter.php"
    
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
        let clothes = NSMutableArray()
        
        for i in 0 ..< jsonResult.count
          
        {
            jsonElement = jsonResult[i] as! NSDictionary
            let clothing = ModelClothing()
            
            if let businessid = jsonElement["businessid"] as? String,
            let name = jsonElement["name"] as? String,
            let address = jsonElement["address"] as? String,
            let phoneno = jsonElement["phoneno"] as? String,
            let emailaddress = jsonElement["emailaddress"] as? String,
            let category = jsonElement["category"] as? String,
            let businessdescription = jsonElement["businessdescription"] as? String
            {
                clothing.businessid = businessid
                clothing.name = name
                clothing.address = address
                clothing.phoneno = phoneno
                clothing.emailaddress = emailaddress
                clothing.category = category
                clothing.businessdescription = businessdescription
            }
            
            clothes.add(clothing)
        }
        DispatchQueue.main.async(execute: { () -> Void in
                          
                    self.delegate?.itemsDownloaded(items: clothes)
                          
                      })
                  }
        }


//
//  FinanceHomeModel.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 01/04/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

protocol FinanceHomeModelProtocol: class {
    func itemsDownloaded(items: NSArray)
}

class FinanceHomeModel: NSObject {
    
    weak var delegate: FinanceHomeModelProtocol!
    var data = Data()
    let urlPath: String = "https://vegan-life.000webhostapp.com/financialfilter.php"
    
    func downloadItems() {
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        let task = defaultSession.dataTask(with: url) { (data, response, error)
            in
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
        let finance = NSMutableArray()
        
        for i in 0 ..< jsonResult.count
          
        {
            jsonElement = jsonResult[i] as! NSDictionary
            let financial = FinanceModel()
            
            if let businessid = jsonElement["businessid"] as? String,
            let name = jsonElement["name"] as? String,
            let address = jsonElement["address"] as? String,
            let phoneno = jsonElement["phoneno"] as? String,
            let emailaddress = jsonElement["emailaddress"] as? String,
            let category = jsonElement["category"] as? String,
            let businessdescription = jsonElement["businessdescription"] as? String
            {
                financial.businessid = businessid
                financial.name = name
                financial.address = address
                financial.phoneno = phoneno
                financial.emailaddress = emailaddress
                financial.category = category
                financial.businessdescription = businessdescription
            }
            
            finance.add(financial)
        }
        DispatchQueue.main.async(execute: { () -> Void in
            self.delegate.itemsDownloaded(items: finance)
        })

    }
    
}


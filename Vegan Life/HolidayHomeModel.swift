//
//  HolidayHomeModel.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 01/04/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

protocol HolidayHomeModelProtocol: class {
    func itemsDownloaded(items: NSArray)
}

class HolidayHomeModel: NSObject{
    
    weak var delegate: HolidayHomeModelProtocol?
//    var data = Data()
    let urlPath: String = "https://vegan-life.000webhostapp.com/holidayfilter.php"
    
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
        let holidays = NSMutableArray()
        
        for i in 0 ..< jsonResult.count
          
        {
            jsonElement = jsonResult[i] as! NSDictionary
            let holiday = HolidayModel()
            
            if let businessid = jsonElement["businessid"] as? String,
            let name = jsonElement["name"] as? String,
            let address = jsonElement["address"] as? String,
            let phoneno = jsonElement["phoneno"] as? String,
            let emailaddress = jsonElement["emailaddress"] as? String,
            let url = jsonElement["url"] as? String,
            let category = jsonElement["category"] as? String,
            let subcategory = jsonElement["subcategory"] as? String,
            let businessdescription = jsonElement["businessdescription"] as? String
            {
                holiday.businessid = businessid
                holiday.name = name
                holiday.address = address
                holiday.phoneno = phoneno
                holiday.emailaddress = emailaddress
                holiday.url = url 
                holiday.category = category
                holiday.subcategory = subcategory
                holiday.businessdescription = businessdescription
            }
            
            holidays.add(holiday)
        }
        DispatchQueue.main.async(){
            self.delegate?.itemsDownloaded(items: holidays)
        }

    }
    
}

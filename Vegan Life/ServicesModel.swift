//
//  ServicesModel.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 29/03/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import Foundation

class ServicesModel: NSObject {
    var businessid: String?
    var name: String?
    var address: String?
    var phoneno: String?
    var emailaddress: String?
    var category: String?
    var subcategory: String?
    var businessdescription: String?
    
    
    override init() {
        
    }
    init(businessid: String, name: String, address: String, phoneno: String, emailaddress: String, category: String,
         subcategory: String, businessdescription: String) {
        self.businessid = businessid
        self.name = name
        self.address = address
        self.phoneno = phoneno
        self.emailaddress = emailaddress
        self.category = category
        self.subcategory = subcategory
        self.businessdescription = businessdescription
    }
   override var description: String {
            return "businessid: \(businessid), name: \(name), address: \(address), phoneno: \(phoneno), emailaddress: \(emailaddress), category: \(category), subcategory:\(subcategory),businessdescription: \(businessdescription)"
        }
    }

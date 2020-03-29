//
//  AppDelegate.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 19/02/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit
import GoogleMaps

let googleApiKey = "AIzaSyBNpskf35UDdUKhG-Wq0KZSskmQ6sdK5-I"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        GMSServices.provideAPIKey(googleApiKey)
        return true
        
    }
}

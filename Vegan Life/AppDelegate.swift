//
//  AppDelegate.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 19/02/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit
//import Moya

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let window = UIWindow()
    let locationService = LocationService()
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
       
     //   switch locationService.status {
     //   case .notDetermined, .denied, .restricted:
       //     let locationViewController = storyboard.instantiateViewController(withIdentifier: "LocationViewController") as? LocationViewController
         //  locationViewController?.locationService = locationService
           // window.rootViewController = locationViewController
       // default:
         // assertionFailure()
         
        
       // }
        
   //    window.makeKeyAndVisible()
        return true
    }


}


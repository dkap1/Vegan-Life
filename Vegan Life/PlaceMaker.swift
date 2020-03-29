//
//  PlaceMaker.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 22/03/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit
import GoogleMaps

class PlaceMaker: GMSMarker {
    let place: GooglePlace
   
    init(place: GooglePlace, availableTypes: [String]){
        self.place = place
        super.init()
        
        position = place.coordinate
        groundAnchor = CGPoint(x: 0.5, y: 1)
        appearAnimation = .pop
        
        var foundType = "vegan"
        let possibleTypes = availableTypes.count > 0 ? availableTypes
        : ["bakery", "bar", "cafe", "grocery_or_supermarket", "restaurant"]
        for type in place.types {
            if possibleTypes.contains(type) {
                foundType = type
                break
            }
            
        }
        icon = UIImage(named: foundType+"_pin")
    }
}

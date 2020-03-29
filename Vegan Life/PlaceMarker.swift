//
//  PlaceMarker.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 22/03/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit
import GoogleMaps

class PlaceMarker: GMSMarker {
  // 1
  let place: GooglePlace
  
  // 2
  init(place: GooglePlace) {
    self.place = place
    super.init()
    
    position = place.coordinate
    icon = UIImage(named: place.placeType+"_pin")
    groundAnchor = CGPoint(x: 0.5, y: 1)
    appearAnimation = .pop
  }
}

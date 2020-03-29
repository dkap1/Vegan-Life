//
//  PlaceAnnotation.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 25/03/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import MapKit

class PlaceAnnotation: NSObject,  MKAnnotation {
    
    @objc dynamic var coordinate: CLLocationCoordinate2D
    
    var title: String?
    var url: URL?
    
    init(coordinate: CLLocationCoordinate2D){
        self.coordinate = coordinate
        super.init()
    }
}

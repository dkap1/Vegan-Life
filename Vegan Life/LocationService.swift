//
//  LocationService.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 13/03/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//
import Foundation
import CoreLocation

protocol LocationServiceDelegate {
    func tracingLocation(_ currentLocation: CLLocation)
    func tracingLocationDidFailWithError(_ error: NSError)
}

class LocationService: NSObject, CLLocationManagerDelegate {
    static let sharedInstance: LocationService = {
        let instance = LocationService()
        return instance
        
    }()
    var locationManager: CLLocationManager?
    var currentLocation: CLLocation?
    var delegate: LocationServiceDelegate?
    
    override init(){
        super.init()
        
        self.locationManager = CLLocationManager()
        guard let locationManager = self.locationManager else {
            return
            
        }
        
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        }
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 200
        locationManager.delegate = self
        
    }
    
    func startUpdatingLocation() {
        print("Starting Location Updates")
        self.locationManager?.startUpdatingLocation()
        
    }
    
    func stopUpdatingLocation() {
        print("Stop Location Updates")
        self.locationManager?.stopUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
            
        }
        
        currentLocation = location
        
        updateLocation(location)
        print(location)
    
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        updateLocationDidFailWithError(error as NSError)
    }
    
    fileprivate func updateLocation(_ currentLocation: CLLocation){
        
        guard let delegate = self.delegate else {
            return
        }
        delegate.tracingLocation(currentLocation)
    }
    fileprivate func updateLocationDidFailWithError(_ error: NSError){
        
        guard let delegate = self.delegate else {
            return
            
        }
        
        delegate.tracingLocationDidFailWithError(error)
        
    }
}


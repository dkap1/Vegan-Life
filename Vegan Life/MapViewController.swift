//
//  MapViewController.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 25/03/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    private enum AnnotationReuseID: String {
        case pin
    }
    @IBOutlet private var mapView: MKMapView!
    
    var mapItems: [MKMapItem]?
    var boundingRegion: MKCoordinateRegion?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let region = boundingRegion {
            mapView.region = region
        }
        mapView.delegate = self
        
        let compass = MKCompassButton(mapView: mapView)
        compass.compassVisibility = .visible
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: compass)
        mapView.showsCompass = false
        
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: AnnotationReuseID.pin.rawValue)
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        guard let mapItems = mapItems else { return }
        
        if mapItems.count == 1, let item = mapItems.first {
            title = item.name
        } else {
            title = NSLocalizedString("TITLE_ALL_PLACES", comment: "All Places view controller title")
        }
        
        let annotations = mapItems.compactMap{ (mapItem) -> PlaceAnnotation? in
            guard let coordinate = mapItem.placemark.location?.coordinate else { return nil }
            
            let annotation = PlaceAnnotation(coordinate: coordinate)
            annotation.title = mapItem.name
            annotation.url = mapItem.url
            
            
            return annotation
            
            
            
        }
        mapView.addAnnotations(annotations)
        
    }
}
extension MapViewController: MKMapViewDelegate {
    func mapViewDidFailLoadingMap(_ mapView: MKMapView, withError error: Error) {
        print("Failed to load map: \(error)")
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) ->
        MKAnnotationView? {
            guard let annotation = annotation as? PlaceAnnotation else { return nil }
            
            let view = mapView.dequeueReusableAnnotationView(withIdentifier: AnnotationReuseID.pin.rawValue, for: annotation) as? MKMarkerAnnotationView
            view?.canShowCallout = true
            view?.clusteringIdentifier = "searchResult"
            
            if annotation.url != nil {
                let infoButton = UIButton(type: .detailDisclosure)
                view?.rightCalloutAccessoryView = infoButton
    }
    
            return view
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
        guard let annotation = view.annotation as? PlaceAnnotation else { return }
        if let url = annotation.url {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
   
    
   

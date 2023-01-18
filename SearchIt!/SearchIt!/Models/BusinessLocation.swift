//
//  BusinessLocation.swift
//  SearchIt!
//
//  
//

//custom class for MKMapView annotations

import UIKit
import MapKit

class BusinessLocation: NSObject, MKAnnotation {
    
    var name: String?
    var coordinate: CLLocationCoordinate2D
    var address: String
    
    init(name: String, coordinate: CLLocationCoordinate2D, address: String) {
        self.name = name
        self.coordinate = coordinate
        self.address = address
    }

}

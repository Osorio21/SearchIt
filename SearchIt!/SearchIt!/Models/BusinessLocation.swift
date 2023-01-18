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
    
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }

}

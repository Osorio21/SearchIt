//
//  MapViewExtension.swift
//  SearchIt!
//
//  
//

//extension of MapViewController class that conforms to CLLocationManagerDelegate
//methods for determining location authorization level and updating map view with user location

import CoreLocation
import MapKit

extension MapViewController: CLLocationManagerDelegate {
    
    //update user location based on last known location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let region = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: region_bounds, longitudinalMeters: region_bounds)
        mapView.setRegion(region, animated: true)
    }
    
    //check permission authorization change by user
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
    
    //initial set up of CLLocationManager object
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    //perform location authorization level check
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        
        //if authorized, present user location, center view on user, and update location as user moves
        case .authorizedWhenInUse, .authorizedAlways:
            mapView.showsUserLocation = true
            centerViewOnUserLocation()
            locationManager.startUpdatingLocation()
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        @unknown default:
            break
        }
    }
    
    //check location services enabled on device
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        }
        else {
            print("Location services are not enabled...")
        }
    }
    
    //center view on user location
    func centerViewOnUserLocation() {
            if let location = locationManager.location?.coordinate {
                let region = MKCoordinateRegion.init(center: location, latitudinalMeters: region_bounds, longitudinalMeters: region_bounds)
                mapView.setRegion(region, animated: true)
            }
    }
}

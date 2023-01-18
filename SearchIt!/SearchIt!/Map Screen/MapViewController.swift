//
//  MapViewController.swift
//  SearchIt!
//
//
//

import UIKit
import MapKit
import CoreLocation

//view controller that provides a map with business location/address and user location
//route from user to business is drawn upon the map

class MapViewController: UIViewController, MKMapViewDelegate {
    
    //outlet to map view on storyboard
    @IBOutlet var mapView: MKMapView!
    
    //declaration of business type variable recieved from BusinessDetailsViewcController
    var business: Business?
    
    //create back transition button
    let rewindItbutton = TransitionButton(frame: CGRect(x: 0, y: 700, width: 200, height: 60), label: "RewindIt!")
    
    //create CLLocationManager object
    let locationManager = CLLocationManager()
    
    //set region bounds for view on user location
    let region_bounds: Double = 5000000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set delegate
        mapView.delegate = self
        
        //force unwrap Business object
        let businessMap = business!
        
        //create selected business annotation and set in view
        let business_location = BusinessLocation(title: businessMap.name, coordinate: CLLocationCoordinate2D(latitude: businessMap.latitude, longitude: businessMap.longitude), info: businessMap.address)
        mapView.addAnnotation(business_location)
        
        //back button properties
        rewindItbutton.accessibilityLabel = NSLocalizedString("Rewind Button", comment: "Rewind button accessibility label")
        rewindItbutton.addTarget(self, action: #selector(returnScreen(sender:)), for: .touchUpInside)
        rewindItbutton.center.x = view.center.x
        self.view.addSubview(rewindItbutton)
        
        //determines if user has allowed location services to be used
        //fails if not sufficient authorizaiton
        checkLocationServices()
        
        //create distance request
        let request = MKDirections.Request()
        
        //set start and end points
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: locationManager.location!.coordinate))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: businessMap.latitude, longitude: businessMap.longitude)))
        
        //allow multiple routes
        request.requestsAlternateRoutes = true
        
        //travel by car
        request.transportType = .automobile
        
        //create directions request
        let directions = MKDirections(request: request)
        
        //add route as overlays to map
        directions.calculate { [unowned self] response, error in
            guard let unwrappedResponse = response else {return}
            
            for route in unwrappedResponse.routes {
                self.mapView.addOverlay(route.polyline)
                self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }
        }
    }
    
    //creates annotation view for business location
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is BusinessLocation else {return nil}
        
        let identifier = "Business"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            
            let button = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = button
        }
        else {
            annotationView?.annotation = annotation
        }
        return annotationView
    }
    
    //creates aleart only on business pin that provides address when tapped
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let business = view.annotation as? BusinessLocation else {return}
        
        let businessName = business.title
        let businessInfo = business.info
        
        let alert = UIAlertController(title: businessName, message: businessInfo, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "GotIt!", style: .default))
        present(alert, animated: true)
    }
    
    //dismiss view if "RewindIt!" button is presssed
    @objc func returnScreen(sender: UIButton) {
        dismiss(animated: true)
    }
    
    //draw route overlays on map in blue
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
        renderer.strokeColor = .blue
        return renderer
    }
}

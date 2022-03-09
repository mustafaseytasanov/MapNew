//
//  MapViewController.swift
//  Map
//
//  Created by Nikita on 03.02.2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    var map = MKMapView()
    var selectedAnnotation: MKPointAnnotation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
    }
    
    
    func setupMap() {
        map = MKMapView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        let location = CLLocationCoordinate2DMake(55.757880, 37.611086)
        let span = MKCoordinateSpan(latitudeDelta: 0.0002, longitudeDelta: 0.0002)
        let region = MKCoordinateRegion(center: location, span: span)
        map.setRegion(region, animated: true)
        locations()
        map.delegate = self
        view.addSubview(map)
    }

    func locations() {
        
        let locations = [CLLocationCoordinate2DMake(55.757800, 37.611006),
                         CLLocationCoordinate2DMake(55.757820, 37.611026),
                         CLLocationCoordinate2DMake(55.757840, 37.611046),
                         CLLocationCoordinate2DMake(55.757860, 37.611066),
                         CLLocationCoordinate2DMake(55.757880, 37.611086),
                         CLLocationCoordinate2DMake(55.757900, 37.611106),
                         CLLocationCoordinate2DMake(55.757920, 37.611126),
                         CLLocationCoordinate2DMake(55.757940, 37.611146),
                         CLLocationCoordinate2DMake(55.757960, 37.611166),
                         CLLocationCoordinate2DMake(55.757980, 37.611186)]
        for i in 0...9 {
            annotations(location: locations[i], index: i)
        }

    }
    
    func annotations(location: CLLocationCoordinate2D, index: Int) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Place \(index+1)".localized
        map.addAnnotation(annotation)
    }
    
    
    @objc func handleClick() {
        //AppDelegate.nav.viewControllers = [DescriptionViewController()]
    }
}


extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        //AppDelegate.nav.pushViewController(DescriptionViewController(), animated: false)
    }
    
}

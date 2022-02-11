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
        let location = CLLocationCoordinate2DMake(55.757962, 37.611006)
        let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        let region = MKCoordinateRegion(center: location, span: span)
        map.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "School"
        annotation.subtitle = "Ooh"
        map.addAnnotation(annotation)
        map.delegate = self
        view.addSubview(map)
    }

    @objc func handleClick() {
        Navigation.nav.viewControllers = [DescriptionViewController()]
    }
}


extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        Navigation.nav.pushViewController(DescriptionViewController(), animated: false)
    }
    
}

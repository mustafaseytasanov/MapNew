//
//  MapViewController.swift
//  Map
//
//  Created by Nikita on 03.02.2022.
//

import UIKit
import MapKit


class CustomPointAnnotation: MKPointAnnotation {
    var tag: Int = 0
}

class MapViewController: UIViewController {
    
    private let map = MKMapView()
    private let viewModel: MapViewModel
    init(viewModel: MapViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.requestOne()
                
        viewModel.updator = { [weak self] in
            self?.setupMap()
        }
    }
    
    func setupMap() {
        map.frame = CGRect(x: 0,
                           y: 0,
                           width: UIScreen.main.bounds.width,
                           height: UIScreen.main.bounds.height)
        let location = CLLocationCoordinate2DMake(41.878, -87.629)
        let span = MKCoordinateSpan(latitudeDelta: 0.003,
                                    longitudeDelta: 0.003)
        let region = MKCoordinateRegion(center: location, span: span)
        map.setRegion(region, animated: true)
        locations()
        map.delegate = self
        view.addSubview(map)
    }

    func locations() {
        var locations = [CLLocationCoordinate2D]()
        for i in 0..<viewModel.dataStorage.count {
            locations.append(CLLocationCoordinate2DMake(viewModel.dataStorage[i].latitude,
                                                        viewModel.dataStorage[i].longitude))
            annotations(location: locations[i], index: i)
        }
    }
    
    func annotations(location: CLLocationCoordinate2D, index: Int) {
        let annotation = CustomPointAnnotation()
        annotation.coordinate = location
        annotation.title = viewModel.dataStorage[index].name
        annotation.tag = index
        map.addAnnotation(annotation)
    }
}


extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
        // Auxiliary function
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView){
                
        if let annotation = view.annotation as? CustomPointAnnotation {
            viewModel.currentTag = annotation.tag
        }
        viewModel.didSubmitAction()
    }
}

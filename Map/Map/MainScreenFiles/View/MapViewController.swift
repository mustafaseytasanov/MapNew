//
//  MapViewController.swift
//  Map
//
//  Created by Nikita on 03.02.2022.
//

import UIKit
import MapKit


var arrayLatitude = [Double]()
var arrayLongitude = [Double]()
var arrayTitles = [String]()
var arrayLocality = [String]()
var arrayAddresses  = [String]()
var arrayFsq = [String]()
var photosWidth = [Double]()
var photosHeight = [Double]()

var currentTag: Int!

class CustomPointAnnotation: MKPointAnnotation {
    var tag: Int!
}

class MapViewController: UIViewController {

    var map = MKMapView()

    var viewModel: URLExample
    init(viewModel: URLExample) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.requestAndEncodingRequestOne()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.viewModel.decodingRequestOne()
            for element in self.viewModel.array {
                arrayLatitude.append(element.latitude)
                arrayLongitude.append(element.longitude)
                arrayTitles.append(element.name)
                arrayLocality.append(element.locality)
                arrayAddresses.append(element.address)
                arrayFsq.append(element.fsqId)
            }
            self.setupMap()
        }

    }
    
    
    func setupMap() {
        map = MKMapView(frame: CGRect(x: 0,
                                      y: 0,
                                      width: UIScreen.main.bounds.width,
                                      height: UIScreen.main.bounds.height))
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
        for i in 0..<arrayLatitude.count {
            locations.append(CLLocationCoordinate2DMake(arrayLatitude[i],
                                                        arrayLongitude[i]))
            annotations(location: locations[i], index: i)
        }
    }
    
    func annotations(location: CLLocationCoordinate2D, index: Int) {
        let annotation = CustomPointAnnotation()
        annotation.coordinate = location
        annotation.title = arrayTitles[index]
        annotation.tag = index
        map.addAnnotation(annotation)
    }
}


extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
        // auxiliary function
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView){
                
        if let annotation = view.annotation as? CustomPointAnnotation {
            currentTag = annotation.tag!
        }
        
        viewModel.requestAndEncodingRequestTwo()

        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) { // Change `3.0` to the desired number of seconds.
           // Code you want to be delayed
            self.viewModel.decodingRequestTwo()
            let neededArray = arrayPhotos
            var path: String = ""
            for element in neededArray {
                let str1 = element.prefix
                let str2 = element.suffix
                path = str1 + "720x540" + str2
                self.viewModel.setImageRequestThree(from: path)
                photosWidth.append(element.width)
                photosHeight.append(element.height)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) { // Change `5.0` to the desired number of seconds.
           // Code you want to be delayed
            AppDelegate.nav.pushViewController(DescriptionViewController(), animated: false)

        }
    }
}

//
//  URLExample.swift
//  Map
//
//  Created by Nikita on 11.03.2022.
//

import Foundation
import SwiftyJSON
import Moya

protocol protocolAllRequests: AnyObject {
    func requestAndEncodingRequestOne()
    func decodingRequestOne()
    func requestAndEncodingRequestTwo()
    func decodingRequestTwo()
    func setImageRequestThree(from url: String)
}

var encodedPhotos = [Data]()
var arrayPhotos = [Photos]()
var imageViewDataArray = [Data]()

class URLExample: protocolAllRequests {

    // Request One
    var array = [PlacesData]()
    var encodedData = [Data]()

    func requestAndEncodingRequestOne() {
        
        let headers = [
          "Accept": "application/json",
          "Authorization": "fsq3KHEsAFWlULlhyqnzd9HlIJajryG97+KckowgycT7Zdw="
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://api.foursquare.com/v3/places/nearby?ll=41.878%2C-87.629&hacc=0.002&altitude=0.002&limit=15")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
            
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest,
                                        completionHandler: { (data, response, error) -> Void in

            guard let data = data, error == nil else { return }
            do {
                let json = try JSONSerialization.jsonObject(
                    with: data, options: .allowFragments) as? [String:Any]
                let results = json?["results"] as? [[String:Any]] ?? []
                
                for i in 0..<results.count {

                    let dict = results[i]
                    let newGeocodes = dict["geocodes"] as? [String:[String:Any]] ?? [:]
                    let newGeocodesMain = newGeocodes["main"]
                    let newLocation = dict["location"] as? [String: Any] ?? [:]
                    
                    let placesDataObject = PlacesData(
                        fsqId: dict["fsq_id"] as! String,
                        latitude: newGeocodesMain?["latitude"] as! Double,
                        longitude: newGeocodesMain?["longitude"] as! Double,
                        address: newLocation["address"] as! String,
                        locality: newLocation["locality"] as! String,
                        name: dict["name"] as! String)
                    let encodeData = try? JSONEncoder().encode(placesDataObject)
                    guard let encodeData = encodeData else {
                        return
                    }
                    
                    self.encodedData.append(encodeData)
                    
                }
            } catch {
                print(error)
            }
        })

        dataTask.resume()
    }
    
    func decodingRequestOne() {
        
        for element in encodedData {

            let placesDataDecode = try? JSONDecoder().decode(
                PlacesData.self, from: element)
            guard let placesDataDecode = placesDataDecode else {
                return
            }
            array.append(placesDataDecode)
            
        }
    }
    
    
    // Request Two
    func requestAndEncodingRequestTwo() {
        
        let headers = [
          "Accept": "application/json",
          "Authorization": "fsq3KHEsAFWlULlhyqnzd9HlIJajryG97+KckowgycT7Zdw="
        ]

        let currentFsqID = arrayFsq[currentTag]
            
        let request = NSMutableURLRequest(
            url: NSURL(string: "https://api.foursquare.com/v3/places/" + currentFsqID + "/photos")! as URL,
            cachePolicy: .useProtocolCachePolicy,
            timeoutInterval: 10.0)
                
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest,
                                        completionHandler: { (data, response, error) -> Void in

            guard let data = data, error == nil else { return }
            do {
                    
                let json = try JSONSerialization.jsonObject(
                    with: data,
                    options: .allowFragments) as? [[String:Any]] ?? []
                                    
                for i in 0..<json.count {
                        
                    let element = json[i]

                    let photosObject = Photos(
                        prefix: element["prefix"] as! String,
                        suffix: element["suffix"] as! String,
                        width: element["width"] as! Double,
                        height: element["height"] as! Double
                    )
                        
                    let encodeData = try? JSONEncoder().encode(photosObject)
                    guard let encodeData = encodeData else {
                        return
                    }
                    encodedPhotos.append(encodeData)
                }
                
            } catch {
                print(error)
            }
        })

        dataTask.resume()
    }
    
    
    func decodingRequestTwo() {
        
        for elementTwo in encodedPhotos {
            let photosDecode = try? JSONDecoder().decode(
                Photos.self, from: elementTwo)
            guard let photosDecode = photosDecode else {
                return
            }
            arrayPhotos.append(photosDecode)
        }
        
        print(arrayPhotos)
    }
    
    // Request 3
    
    func setImageRequestThree(from url: String) {
        let url = URL(string: url)!
        
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, _, _) in
            if let data = data {
                imageViewDataArray.append(data)
            }
        }
        
        dataTask.resume()
    }
}

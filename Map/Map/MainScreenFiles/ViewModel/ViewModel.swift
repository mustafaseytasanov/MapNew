//
//  URLExample.swift
//  Map
//
//  Created by Nikita on 11.03.2022.
//

import Foundation
import SwiftyJSON
import Moya

var imageViewDataArray = [Data]()

enum ErrorResults: Error {
    case noDataAvailable
    case canNotProcessData
}

protocol protocolAllRequests: AnyObject {}

class URLExample: protocolAllRequests {

    static var dataStorage: [MainData] = []
    static var updator: () -> Void = {}
    static var dataStorageTwo: [PhotosData] = []
    static var updatorTwo: () -> Void = {}
    
    // Request One
    func requestOne() {
        
        let headers = [
          "Accept": "application/json",
          "Authorization": "fsq3KHEsAFWlULlhyqnzd9HlIJajryG97+KckowgycT7Zdw="
        ]

        let request = NSMutableURLRequest(url: NSURL(
            string: "https://api.foursquare.com/v3/places/nearby?ll=41.878%2C-87.629&hacc=0.002&altitude=0.002&limit=15")! as URL,
            cachePolicy: .useProtocolCachePolicy,
            timeoutInterval: 10.0)
            
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest,
                                        completionHandler: { (data, response, error) -> Void in

            guard let data = data, error == nil else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let dataResponce = try decoder.decode(DataExample.self, from: data)
                DispatchQueue.main.async {
                    URLExample.dataStorage = dataResponce.results.map { MainData(from: $0) }
                    URLExample.updator()
                }
            } catch {
                print(error.localizedDescription)
            }
        })

        dataTask.resume()
    }
    
    // Request Two
    func requestTwo() {
        
        //let currentFsqID = list[currentTag].fsqId
        let currentFsqID = URLExample.dataStorage[currentTag].fsqId

        let headers = [
          "Accept": "application/json",
          "Authorization": "fsq3KHEsAFWlULlhyqnzd9HlIJajryG97+KckowgycT7Zdw="
        ]
        let request = NSMutableURLRequest(
            url: NSURL(string: "https://api.foursquare.com/v3/places/" + currentFsqID + "/photos")! as URL,
            cachePolicy: .useProtocolCachePolicy,
            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request as URLRequest,
                                        completionHandler: { (data, response, error) -> Void in

            guard let data = data, error == nil else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let photoResponce = try decoder.decode([Photos].self, from: data)
                DispatchQueue.main.async {
                    URLExample.dataStorageTwo = photoResponce.map { PhotosData(from: $0) }
                    URLExample.updatorTwo()
                }
            } catch {
                print(error.localizedDescription)
            }
        })

        dataTask.resume()
    }
    
    
    // Request 3
    func setImageRequestThree(from url: String) {
        
        imageViewDataArray = []
        let url = URL(string: url)!
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, _, _) in
            if let data = data {
                imageViewDataArray.append(data)
            }
        }
        dataTask.resume()
    }
}

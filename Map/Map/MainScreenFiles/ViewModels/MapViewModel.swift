//
//  URLExample.swift
//  Map
//
//  Created by Nikita on 11.03.2022.
//

import Foundation
import SwiftyJSON

protocol protocolForRequestOne: AnyObject {}

class MapViewModel: protocolForRequestOne {

    var dataStorage: [MainDTO] = []
    var updator: () -> Void = {}
    
    var didSubmitAction: () -> Void = {}
    var currentTag: Int = 0
        
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
                let dataResponce = try decoder.decode(Main.self, from: data)
                DispatchQueue.main.async {
                    self.dataStorage = dataResponce.results.map { MainDTO(from: $0) }
                    self.updator()
                }
            } catch {
                print(error.localizedDescription)
            }
        })

        dataTask.resume()
    }

}

//
//  ViewModelTwo.swift
//  Map
//
//  Created by Nikita on 05.04.2022.
//

import Foundation
import UIKit


protocol protocolForRequestsTwoAndThree: AnyObject {}


class DescriptionViewModel: protocolForRequestsTwoAndThree {
    
    var imageViewArray = [UIImageView]()
    
    var dataFromMapMainData: [MainDTO] = []
    var dataFromMapCurrentTag: Int = 0
    
    var dataStorage: [PhotosDTO] = []
    
    var waiting: () -> Void = {}
    var readySetupContent: () -> Void = {}
    
    var toMap: () -> Void = {}
    var toLogin: () -> Void = {}

    // Request Two
    func requestTwo(completion: @escaping([PhotosDTO]) -> Void) {
        
        let currentFsqID = dataFromMapMainData[dataFromMapCurrentTag].fsqId

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
                    self.dataStorage = photoResponce.map {PhotosDTO( from: $0) }
                    completion(self.dataStorage)
                }
            } catch {
                print(error.localizedDescription)
            }
        })

        dataTask.resume()
    }
    
    // Request 3
    func requestThree(from url: String) {
        
        let url = URL(string: url)!
        let dataTask = URLSession.shared.dataTask(with: url) { (data, responce, error) in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                let imageView = UIImageView()
                let image = UIImage(data: data)
                imageView.image = image
                self.imageViewArray.append(imageView)
                self.waiting()
            }
        }
        dataTask.resume()
    }
}

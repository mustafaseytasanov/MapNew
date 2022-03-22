//
//  UrlDataModel.swift
//  Map
//
//  Created by Nikita on 11.03.2022.
//

import Foundation

struct PlacesData: Codable {
    var fsqId: String
    var latitude: Double
    var longitude: Double
    var address: String
    var locality: String
    var name: String
}


//
//  DataExample.swift
//  Map
//
//  Created by Nikita on 31.03.2022.
//

import Foundation

struct DataExample: Codable {
    var results: [Results]
}

struct Results: Codable {
    var fsqId: String
    var geocodes: Geocodes
    var location: Location
    var name: String

    enum CodingKeys: String, CodingKey {
        case fsqId = "fsq_id"
        case geocodes
        case location
        case name
    }
}

struct Location: Codable {
    var address: String
    var locality: String
}

struct Geocodes: Codable {
    var main: MainGeocodes
}

struct MainGeocodes: Codable {
    var latitude: Double
    var longitude: Double
}

//
//  MainData.swift
//  Map
//
//  Created by Nikita on 04.04.2022.
//

import Foundation

struct MainData {
    
    let fsqId: String
    let latitude: Double
    let longitude: Double
    let address: String
    let locality: String
    let name: String
    
    init(from model: Results) {
        self.fsqId = model.fsqId
        self.latitude = model.geocodes.main.latitude
        self.longitude = model.geocodes.main.longitude
        self.address = model.location.address
        self.locality = model.location.locality
        self.name = model.name
    }
}

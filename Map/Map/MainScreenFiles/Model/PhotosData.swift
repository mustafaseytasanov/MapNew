//
//  PhotosData.swift
//  Map
//
//  Created by Nikita on 04.04.2022.
//

import Foundation

struct PhotosData {
    
    let prefix: String
    let suffix: String
    let width: Double
    let height: Double
    
    init(from model: Photos) {
        self.prefix = model.prefix
        self.suffix = model.suffix
        self.width = model.width
        self.height = model.height
    }
}

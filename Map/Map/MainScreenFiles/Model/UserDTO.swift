//
//  UserDto.swift
//  Map
//
//  Created by Nikita on 05.03.2022.
//

import Foundation

struct UserDTO {
    let id: Int
    let fullName: String
    let email: String
    let avatarUrl: URL?
    
    init(from model: UserDataModel) {
        self.id = model.id
        self.fullName = "\(model.firstName) \(model.lastName)"
        self.email = model.email
        self.avatarUrl = URL(string: model.avatar)
    }
}

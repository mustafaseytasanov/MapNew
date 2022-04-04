//
//  BaseRouter.swift
//  Map
//
//  Created by Nikita on 04.03.2022.
//

import Foundation
import UIKit

protocol Router {
    func route(to routeID: String, from context: UIViewController)
}

enum Route: String {
     case map
}

var router: Router!



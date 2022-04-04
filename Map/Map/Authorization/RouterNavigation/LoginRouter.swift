//
//  LoginRouterNew.swift
//  Map
//
//  Created by Nikita on 25.03.2022.
//

import Foundation
import UIKit

class LoginRouter: Router {
     
    func route(to routeID: String, from context: UIViewController) {
        
        guard let route = Route(rawValue: routeID) else {
            return
        }
        switch route {
        case .map:
            print(context)
            let vc = MapViewController(viewModel: URLExample())
            context.navigationController?.pushViewController(vc, animated: true)
            //print(context.navigationController?.viewControllers)
        }
    }
}

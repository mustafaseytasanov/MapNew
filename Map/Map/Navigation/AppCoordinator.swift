//
//  AppCoordinator.swift
//  Map
//
//  Created by Nikita on 05.04.2022.
//

import Foundation
import UIKit

class AppCoordinator : BaseCoordinator {

    let window : UIWindow

    init(window: UIWindow) {
        self.window = window
        super.init()
    }

    override func start() {
        // preparing root view
        let navigationController = UINavigationController()
        
        var myCoordinator = BaseCoordinator()
        if LoginManager.isLoggedIn == false {
            myCoordinator = LoginCoordinator(navigationController: navigationController)
        } else {
            myCoordinator = MapCoordinator(navigationController: navigationController)
        }
        
        // store child coordinator
        self.store(coordinator: myCoordinator)
        myCoordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        // detect when free it
        myCoordinator.isCompleted = { [weak self] in
            self?.free(coordinator: myCoordinator)
        }
        
    }
}

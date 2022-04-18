//
//  CoordinatorC.swift
//  Map
//
//  Created by Nikita on 06.04.2022.
//

import Foundation
import UIKit

// responsible of flow to ViewControllerA
class LoginCoordinator: BaseCoordinator {
    
    let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        
        let viewModel = LoginViewModel()
        let viewController = LoginViewController(viewModel: viewModel)
        viewModel.moveToMap = { [weak self] in
            self?.navigateToFlowA()
        }

        self.navigationController.viewControllers = [viewController]
    }
        
    func navigateToFlowA() {
        let coordinatorA = MapCoordinator(navigationController: self.navigationController)
        self.store(coordinator: coordinatorA)
        coordinatorA.start()
    }
    
}

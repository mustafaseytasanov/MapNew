//
//  CoordinatorB.swift
//  Map
//
//  Created by Nikita on 06.04.2022.
//

import Foundation
import UIKit

// responsible of flow to ViewControllerB
class DescriptionCoordinator: BaseCoordinator {
    
    let navigationController: UINavigationController
    let data: [MainDTO]
    init(navigationController: UINavigationController, data: [MainDTO]) {
        self.navigationController = navigationController
        self.data = data
    }

    override func start() {
        
        let viewModel = DescriptionViewModel()
        let viewController = DescriptionViewController(viewModel: viewModel)
        viewModel.dataFromMap = self.data
        
        viewModel.toMap = { [weak self] in
            self?.navigateToFlowA()
        }
        viewModel.toLogin = { [weak self] in
            self?.navigateToFlowC()
        }
        
        self.navigationController.viewControllers = [viewController]
    }
    
    func navigateToFlowA() {
        let coordinatorA = MapCoordinator(navigationController: self.navigationController)
        self.store(coordinator: coordinatorA)
        coordinatorA.start()
    }
    
    func navigateToFlowC() {
        let coordinatorC = LoginCoordinator(navigationController: self.navigationController)
        self.store(coordinator: coordinatorC)
        coordinatorC.start()
    }
    
}

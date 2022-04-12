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
    let currentTag: Int
    init(navigationController: UINavigationController, data: [MainDTO], currentTag: Int) {
        self.navigationController = navigationController
        self.data = data
        self.currentTag = currentTag
    }

    override func start() {
        
        let viewModel = DescriptionViewModel()
        let viewController = DescriptionViewController(viewModel: viewModel)
        viewModel.dataFromMapMainData = self.data
        viewModel.dataFromMapCurrentTag = self.currentTag
        
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

//
//  CoordinatorB.swift
//  Map
//
//  Created by Nikita on 06.04.2022.
//

import Foundation
import UIKit

// responsible of flow to ViewControllerA
class MapCoordinator: BaseCoordinator {
    
    let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        
        let viewModel = MapViewModel()
        let viewController = MapViewController(viewModel: viewModel)
        
        viewModel.didSubmitAction = { [weak self] in
            self?.navigateToFlowB(with: viewModel.dataStorage, currentTag: viewModel.currentTag)
        }
        
        self.navigationController.viewControllers = [viewController]
    }
    
    func navigateToFlowB(with data: [MainDTO], currentTag: Int) {
        let coordinatorB = DescriptionCoordinator(
            navigationController: self.navigationController, data: data, currentTag: currentTag)
        self.store(coordinator: coordinatorB)
        coordinatorB.start()
    }
}

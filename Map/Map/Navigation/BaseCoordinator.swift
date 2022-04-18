//
//  BaseCoordinator.swift
//  Map
//
//  Created by Nikita on 05.04.2022.
//

import Foundation

class BaseCoordinator : Coordinator {
    var childCoordinators : [Coordinator] = []
    var isCompleted: (() -> ())?

    func start() {
        fatalError("Children should implement `start`.")
    }
}

//
//  BaseRouter.swift
//  Map
//
//  Created by Nikita on 04.03.2022.
//

import Foundation
import UIKit

class BaseRouter {
    init(sourceViewController: UIViewController) {
        self.sourceViewController = sourceViewController
    }

    weak var sourceViewController: UIViewController?
}

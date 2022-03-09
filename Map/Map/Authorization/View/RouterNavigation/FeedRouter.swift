//
//  FeedRouter.swift
//  Map
//
//  Created by Nikita on 04.03.2022.
//

import Foundation
import UIKit

final class FeedRouter : BaseRouter {
    func showDetail(viewModel: LoginViewModel) {
        let vc = LoginViewController(viewModel: viewModel)
        vc.viewModel = viewModel
        sourceViewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

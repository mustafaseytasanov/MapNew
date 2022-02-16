//
//  AppDelegate.swift
//  Map
//
//  Created by Nikita on 24.01.2022.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let vc: UIViewController

        
        if LoginManager.isLoggedIn == false {
            vc = LoginViewController(viewModel: LoginViewModel())
        } else {
            vc = MainViewController()
        }
        
        Navigation.nav.setViewControllers([vc], animated: false)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = Navigation.nav
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        return true
    }

}

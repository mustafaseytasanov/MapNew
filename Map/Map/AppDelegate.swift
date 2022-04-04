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
        
    static var nav = UINavigationController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // temp
        LoginManager.isLoggedIn = true
        
        var startVC: UIViewController
        if LoginManager.isLoggedIn == false {
            startVC = LoginViewController(viewModel: LoginViewModel())
        } else {
            startVC = MapViewController(viewModel: URLExample())
        }
        
        AppDelegate.nav = UINavigationController.init(rootViewController: startVC)
                
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = AppDelegate.nav
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()

        return true
        
    }

}

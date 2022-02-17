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
    var NavigationVC: UINavigationController?
    
    static var nav = UINavigationController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        var vc: UIViewController
        if LoginManager.isLoggedIn == false {
            vc = LoginViewController(viewModel: LoginViewModel())
        } else {
            vc = MainViewController()
        }

        
        AppDelegate.nav = UINavigationController.init(rootViewController: vc)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = AppDelegate.nav
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()


        return true
        
       
        
    }

}

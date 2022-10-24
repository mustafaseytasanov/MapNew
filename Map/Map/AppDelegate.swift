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
    private var appCoordinator : AppCoordinator!
        
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
                                
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        let appCoordinator = AppCoordinator(window: window!)
        appCoordinator.start()
        self.appCoordinator = appCoordinator
        return true
    }
}

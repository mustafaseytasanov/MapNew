//
//  LoginManager.swift
//  Map
//
//  Created by Nikita on 10.02.2022.
//

import UIKit

class LoginManager: NSObject {
    
    static var isLoggedIn: Bool  {
        
        get {
            return UserDefaults.standard.bool(forKey: "isLoggedIn")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "isLoggedIn")
            UserDefaults.standard.synchronize()
        }
    }
    
}

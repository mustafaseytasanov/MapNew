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
    
    // Login
    static var login: String  {
        get {
            return UserDefaults.standard.string(forKey: "login") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "login")
        }
    }
    
    // E-mail
    static var email: String  {
        get {
            return UserDefaults.standard.string(forKey: "email") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "email")
        }
    }
    
    // Password
    static var password: String  {
        get {
            return UserDefaults.standard.string(forKey: "password") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "password")
        }
    }
    
    
}

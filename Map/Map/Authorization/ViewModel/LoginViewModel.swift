//
//  ViewModel.swift
//  Map
//
//  Created by Nikita on 11.02.2022.
//

import Foundation

protocol LoginViewModelProtocol: AnyObject {
    func checkingText() -> Bool
    func checkingTextTwo()
    func valueSwitch(_ value: Bool)
}


final class LoginViewModel: LoginViewModelProtocol {
    
    var login = Dynamic("")
    
    var allElements = [false, false, false, false, false]
    var allElementsTwo = [false, false]
    
    let elements = [Enum.login, Enum.email, Enum.password, Enum.repeatPassword]
    let elementsTwo = [Enum.email, Enum.password]

    var signInData = SignInData()
    var signUpData = SignUpData()
    
    var array = [true, true, true, true]
    
    func updateValues(text: String, cellType: Enum) {
                
        if flag == 1 {
            switch cellType {
            case .login:
                signUpData.login = text
            case .email:
                signUpData.email = text
            case .password:
                signUpData.password = text
            case .repeatPassword:
                signUpData.repeatPassword = text
            }
        } else {
            switch cellType {
            case .email:
                signInData.email = text
            case .password:
                signInData.password = text
            default:
                break
            }
        }
    }
    
    func checkingText() -> Bool {
        
        allElements[0] = LoginHelper.isValidLogin(signUpData.login)
        allElements[1] = EmailHelper.isValidEmail(signUpData.email)
        allElements[2] = PasswordHelper.isValidPassword(signUpData.password)
        allElements[3] = signUpData.password == signUpData.repeatPassword
        
        array[0] = LoginHelper.isValidLogin(signUpData.login)
        array[1] = EmailHelper.isValidEmail(signUpData.email)
        array[2] = PasswordHelper.isValidPassword(signUpData.password)
        array[3] = signUpData.password == signUpData.repeatPassword
        
        if allElements[0] == true && allElements[1] == true &&
                allElements[2] == true && allElements[3] == true &&
                allElements[4] == true {
            AppDelegate.nav.viewControllers = [MainViewController()]
            LoginManager.login = signUpData.login
            LoginManager.email = signUpData.email
            LoginManager.password = signUpData.password
            LoginManager.isLoggedIn = true
            signUpData.login = ""
            signUpData.email = ""
            signUpData.password = ""
            signUpData.repeatPassword = ""
            return true
        }
        return false
    }
    
    func getBoolArray() -> (array: [Bool], signUpData: [String]) {
        return (array, [signUpData.login, signUpData.email,
                       signUpData.password, signUpData.repeatPassword])
    }
    
    
    func checkingTextTwo() {
        
        allElementsTwo[0] = signInData.email == LoginManager.email
        allElementsTwo[1] = signInData.password == LoginManager.password
        
        if allElementsTwo[0] == true && allElementsTwo[1] == true {
            AppDelegate.nav.viewControllers = [MainViewController()]
            LoginManager.isLoggedIn = true
            signInData.email = ""
            signInData.password = ""
        }
    }
    
    func valueSwitch(_ value: Bool) {
        if value {
            allElements[4] = true
        } else {
            allElements[4] = false
        }
    }
        
}

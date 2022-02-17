//
//  ViewModel.swift
//  Map
//
//  Created by Nikita on 11.02.2022.
//

import Foundation

protocol LoginViewModelProtocol: AnyObject {
    func checkingText()
    func checkingTextTwo()
    func valueSwitch(_ value: Bool)
}

final class LoginViewModel: LoginViewModelProtocol {
        
    var allElements = [false, false, false, false, false]
    var allElementsTwo = [false, false]
    
    let elements = [Enum.login, Enum.email, Enum.password, Enum.repeatPassword]
    let elementsTwo = [Enum.email, Enum.password]

    var signInData = SignInData()
    var signUpData = SignUpData()
    
    func checkingText() {
        
        allElements[0] = LoginHelper.isValidLogin(login)
        allElements[1] = EmailHelper.isValidEmail(emailUp)
        allElements[2] = PasswordHelper.isValidPassword(passwordUp)
        allElements[3] = passwordUp == repeatPassword
        
        if allElements[0] == true && allElements[1] == true && allElements[2] == true && allElements[3] == true && allElements[4] == true {
            AppDelegate.nav.viewControllers = [MainViewController()]
            LoginManager.login = login
            LoginManager.email = emailUp
            LoginManager.password = passwordUp
            LoginManager.isLoggedIn = true
        }
    }
    
    func checkingTextTwo() {
        
        allElementsTwo[0] = emailIn == LoginManager.email
        allElementsTwo[1] = passwordIn == LoginManager.password
        
        if allElementsTwo[0] == true && allElementsTwo[1] == true {
            AppDelegate.nav.viewControllers = [MainViewController()]
            LoginManager.isLoggedIn = true
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

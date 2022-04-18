//
//  ViewModel.swift
//  Map
//
//  Created by Nikita on 11.02.2022.
//

import Foundation

protocol LoginViewModelProtocol: AnyObject {
    func signUpValidation() -> Bool
    func userAuthorization()
    func valueSwitch(_ value: Bool)
}


final class LoginViewModel: LoginViewModelProtocol {
    
    var moveToMap: () -> Void = {}
    var segmentedControlSelectedIndex = 1
    
    var signUpParametersChecking = [false, false, false, false, true]
    var signInParametersChecking = [false, false]
    var arrayValidation = [true, true, true, true]
    
    let elements = [CellIndices.login, CellIndices.email,
                    CellIndices.password, CellIndices.repeatPassword]
    let elementsTwo = [CellIndices.email, CellIndices.password]
    
    var signUpLogin: String = ""
    var signUpEmail: String = ""
    var signUpPassword: String = ""
    var signUpRepeatPassword: String = ""
    var signInEmail: String = ""
    var signInPassword: String = ""
    
    
    func updateValues(text: String, cellType: CellIndices) {
                
        if segmentedControlSelectedIndex == 1 {
            switch cellType {
            case .login:
                signUpLogin = text
            case .email:
                signUpEmail = text
            case .password:
                signUpPassword = text
            case .repeatPassword:
                signUpRepeatPassword = text
            }
        } else {
            switch cellType {
            case .email:
                signInEmail = text
            case .password:
                signInPassword = text
            default:
                break
            }
        }
    }
    
    func signUpValidation() -> Bool {
        
        signUpParametersChecking[0] = LoginHelper.isValidLogin(signUpLogin)
        signUpParametersChecking[1] = EmailHelper.isValidEmail(signUpEmail)
        signUpParametersChecking[2] = PasswordHelper.isValidPassword(signUpPassword)
        signUpParametersChecking[3] = signUpPassword == signUpRepeatPassword

        arrayValidation[0] = LoginHelper.isValidLogin(signUpLogin)
        arrayValidation[1] = EmailHelper.isValidEmail(signUpEmail)
        arrayValidation[2] = PasswordHelper.isValidPassword(signUpPassword)
        arrayValidation[3] = signUpPassword == signUpRepeatPassword
        
        if signUpParametersChecking[0] && signUpParametersChecking[1] &&
            signUpParametersChecking[2] && signUpParametersChecking[3] &&
            signUpParametersChecking[4] {
            
            moveToMap()
    
            LoginManager.login = signUpLogin
            LoginManager.email = signUpEmail
            LoginManager.password = signUpPassword
            LoginManager.isLoggedIn = true

            signUpLogin = ""
            signUpEmail = ""
            signUpPassword = ""
            signUpRepeatPassword = ""
            
            return true
        }
        return false
    }
    
    func getValidArrayAndSignUpData() -> (array: [Bool], signUpData: [String]) {
        return (arrayValidation, [signUpLogin, signUpEmail,
                       signUpPassword, signUpRepeatPassword])
    }
    
    
    func userAuthorization() {
        
        signInParametersChecking[0] = signInEmail == LoginManager.email
        signInParametersChecking[1] = signInPassword == LoginManager.password
        
        if signInParametersChecking[0] && signInParametersChecking[1] {
            
            moveToMap()
            
            LoginManager.isLoggedIn = true
            signInEmail = ""
            signInPassword = ""
        }
    }
    
    func valueSwitch(_ value: Bool) {
        if value {
            signUpParametersChecking[4] = true
        } else {
            signUpParametersChecking[4] = false
        }
    }
        
}

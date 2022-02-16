//
//  ViewModel.swift
//  Map
//
//  Created by Nikita on 11.02.2022.
//

import Foundation

protocol LoginViewModelProtocol: AnyObject {
    
    func checkingText()
}

final class LoginViewModel: LoginViewModelProtocol {
    
    let elements = [Enum.login, Enum.email, Enum.password, Enum.repeatPassword]
    let elementsTwo = [Enum.email, Enum.password]
    
    func checkingText() {
        
        print(LoginHelper.isValidLogin(DataSourceRegistration.arrayTextFieldElements[0]))
        print(EmailHelper.isValidEmail(DataSourceRegistration.arrayTextFieldElements[1]))
        print(PasswordHelper.isValidPassword(DataSourceRegistration.arrayTextFieldElements[2]))
        print(DataSourceRegistration.arrayTextFieldElements[2] == DataSourceRegistration.arrayTextFieldElements[3])

    }
        
    
}

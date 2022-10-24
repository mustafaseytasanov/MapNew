//
//  Footer.swift
//  Map
//
//  Created by Nikita on 14.02.2022.
//

import UIKit

protocol AuthTableFooterDelegate: AnyObject {
    func buttonHandleUp()
    func buttonHandleIn()
    func valueSwitchChanged(value: Bool)
}


class AuthTableFooter: UIView {
        
    weak var delegate: AuthTableFooterDelegate?

    private let viewForSignUp: UIView
    private let viewForSignIn: UIView
    init(viewForSignUp: UIView, viewForSignIn: UIView) {
        self.viewForSignUp = viewForSignUp
        self.viewForSignIn = viewForSignIn
        super.init(frame: CGRect())
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Components for "Sign up Footer"
    private let label: UILabel = {
        let labelText = UILabel()
        labelText.frame = CGRect(x: 16, y: 15, width: 250, height: 20)
        labelText.font = UIFont.systemFont(ofSize: 22)
        labelText.text = "Agree with the rules".localized
        return labelText
    }()
    
    private let switchOption: UISwitch = {
        let switchComponent = UISwitch()
        switchComponent.isOn = true
        switchComponent.frame = CGRect(x: UIScreen.main.bounds.width - switchComponent.bounds.width - 16,
                               y: 10,
                               width: switchComponent.bounds.width,
                               height: 20)
        return switchComponent
    }()
    
    private let buttonUp: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: (UIScreen.main.bounds.width - 200)/2,
                              y: 60,
                              width: 200,
                              height: 30)
        button.backgroundColor = UIColor.white
        button.setTitleColor(.blue, for: .normal)
        button.setTitle("Sign up".localized, for: .normal)
        return button
    }()
    
    // Component for "Sign in Footer"
    private let buttonIn: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: (UIScreen.main.bounds.width - 100)/2,
                              y: 5,
                              width: 100,
                              height: 30)
        button.backgroundColor = UIColor.white
        button.setTitleColor(.blue, for: .normal)
        button.setTitle("Sign in".localized, for: .normal)
        return button
    }()
    
    // Function for "Sign up Footer"
    func myFooterOneView() -> UIView {
        
        viewForSignUp.frame = CGRect(x: 0,
                            y: 0,
                            width: UIScreen.main.bounds.width,
                            height: 100)
        viewForSignUp.addSubview(label)
        viewForSignUp.addSubview(switchOption)
        viewForSignUp.addSubview(buttonUp)
        switchOption.addTarget(self,
                               action: #selector(handleSwitchUp(param:)),
                               for: .valueChanged)
        buttonUp.addTarget(self,
                           action: #selector(buttonHandleUp),
                           for: .touchUpInside)
        return viewForSignUp
    }
    
    // Function for "Sign in Footer"
    func myFooterTwoView() -> UIView {
        
        viewForSignIn.frame = CGRect(x: 0,
                            y: 0,
                            width: UIScreen.main.bounds.width,
                            height: 40)
        viewForSignIn.addSubview(buttonIn)
        buttonIn.addTarget(self,
                           action: #selector(buttonHandleIn),
                           for: .touchUpInside)
        return viewForSignIn
    }

    // Handlers
    @objc func buttonHandleUp(param: UIButton) {
        delegate?.buttonHandleUp()
    }
    
    @objc func buttonHandleIn(param: UIButton) {
        delegate?.buttonHandleIn()
    }
    
    @objc func handleSwitchUp(param: UISwitch) {
        
        if param.isOn {
            delegate?.valueSwitchChanged(value: true)
        } else {
            delegate?.valueSwitchChanged(value: false)
        }
    }
    
}

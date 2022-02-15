//
//  Footer.swift
//  Map
//
//  Created by Nikita on 14.02.2022.
//

import UIKit


protocol FooterDelegate: AnyObject {
    func switchUp(param: UISwitch)
    func buttonSelected(param: UIButton)
}


class AuthTableFooter: UIView {
    
    weak var delegate: FooterDelegate?
    
    var label: UILabel = {
        let labelText = UILabel()
        labelText.frame = CGRect(x: 16, y: 15, width: 250, height: 20)
        labelText.font = UIFont.systemFont(ofSize: 22)
        labelText.text = "Согласен с правилами"
        return labelText
    }()
    
    var switchOption: UISwitch = {
        let switchh = UISwitch()
        switchh.frame = CGRect(x: UIScreen.main.bounds.width - switchh.bounds.width - 16,
                               y: 10,
                               width: switchh.bounds.width,
                               height: 20)
        return switchh
    }()
    
    var buttonUp: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: (UIScreen.main.bounds.width - 200)/2,
                              y: 60,
                              width: 200,
                              height: 30)
        button.backgroundColor = UIColor.white
        button.setTitleColor(.blue, for: .normal)
        button.setTitle("Зарегистрироваться", for: .normal)
        return button
    }()
    
    var buttonIn: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: (UIScreen.main.bounds.width - 100)/2,
                              y: 5,
                              width: 100,
                              height: 30)
        button.backgroundColor = UIColor.white
        button.setTitleColor(.blue, for: .normal)
        button.setTitle("Войти", for: .normal)
        return button
    }()
    
    
    func myFooterOneView() -> UIView {
        let viewFooter = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
        viewFooter.addSubview(label)
        viewFooter.addSubview(switchOption)
        viewFooter.addSubview(buttonUp)
        switchOption.addTarget(self, action: #selector(handleSwitchUp(param:)), for: .valueChanged)
        buttonUp.addTarget(self, action: #selector(buttonHandleUp(param:)), for: .touchUpInside)
        return viewFooter
    }
    
    func myFooterTwoView() -> UIView {
        let viewFooter = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
        viewFooter.addSubview(buttonIn)
        buttonIn.addTarget(self, action: #selector(buttonHandleIn(param:)), for: .touchUpInside)
        return viewFooter
    }

    
    @objc func buttonHandleUp(param: UIButton) {
        delegate?.buttonSelected(param: buttonUp)
    }
    
    @objc func buttonHandleIn(param: UIButton) {
        delegate?.buttonSelected(param: buttonIn)
    }
    
    @objc func handleSwitchUp(param: UISwitch) {
        delegate?.switchUp(param: switchOption)
    }
    
}

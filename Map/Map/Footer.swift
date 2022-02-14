//
//  Footer.swift
//  Map
//
//  Created by Nikita on 14.02.2022.
//

import UIKit

class Footer: UIView {

    var footerView: UIView = {
        let footer = UIView()
        footer.backgroundColor = .red
        footer.frame = CGRect(x: 0, y: 0, width: 300, height: 70)
        return footer
    }()
    
    var buttonOk: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        button.backgroundColor = UIColor.white
        button.setTitleColor(.blue, for: .normal)
        button.setTitle("Зарегистрироваться", for: .normal)
        return button
    }()
    
    
    /*
    @objc func buttonSelected(param: UIButton) {
        
        if flag == 1 {
            if allElements[0] == 1 && allElements[1] == 1 && allElements[2] == 1 && allElements[3] == 1 && allElements[4] == 1 {
                
                Navigation.nav.viewControllers = [MainViewController()]
                storeKeys()
                LoginManager.isLoggedIn = true
            }
        } else {
            if allElementsTwo[0] == 1 && allElementsTwo[1] == 1 {
                Navigation.nav.viewControllers = [MainViewController()]
                LoginManager.isLoggedIn = true
            }
        }
    }*/
    
    var label: UILabel = {
        let labelText = UILabel()
        labelText.frame = CGRect(x: 0, y: 40, width: 250, height: 20)
        labelText.font = UIFont.systemFont(ofSize: 22)
        labelText.text = "Согласен с правилами"
        return labelText
    }()
    
    var switchOption: UISwitch = {
        let switchh = UISwitch()
        switchh.frame = CGRect(x: 250, y: 40, width: 50, height: 20)
        return switchh
    }()

    
    func setupFooterOne() {
        buttonOk.setTitle("Зарегистрироваться", for: .normal)
        //switchOption.addTarget(self, action: #selector(handleSwitchUp(param:)), for: .valueChanged)
        //buttonOk.addTarget(self, action: #selector(buttonSelected(param:)), for: .touchUpInside)
        footerView.addSubview(label)
        footerView.addSubview(switchOption)
        footerView.addSubview(buttonOk)
    }
    /*
    @objc func handleSwitchUp(param: UISwitch) {
        if param.isOn {
            updateArray(value: 1)
        } else {
            updateArray(value: 0)
        }
    }*/
    
    /*
    func updateArray(value: Int) {
        allElements[4] = value
    }*/
    
    
    func setupFooterZero() {
        buttonOk.setTitle("Войти", for: .normal)
        //buttonOk.addTarget(self, action: #selector(buttonSelected(param:)), for: .touchUpInside)
        footerView.addSubview(buttonOk)
        //tableView.tableFooterView = footerView
    }
    
    
    
    
    

}

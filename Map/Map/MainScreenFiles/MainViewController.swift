//
//  MainViewController.swift
//  Map
//
//  Created by Nikita on 28.01.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var button = UIButton()
    var button2 = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Основной экран".localized
        setButton()
        openMap()
    }
    
    func setButton() {
        button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 40))
        button.setTitle("Выйти".localized, for: .normal)
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc func handleButton() {
        LoginManager.isLoggedIn = false
        AppDelegate.nav.viewControllers = [LoginViewController(viewModel: LoginViewModel())]
    }
    
    
    func openMap() {
        button2 = UIButton(frame: CGRect(x: 100, y: 250, width: 100, height: 40))
        button2.setTitle("Карта".localized, for: .normal)
        button2.backgroundColor = UIColor.green
        button2.addTarget(self, action: #selector(handleButton2), for: .touchUpInside)
        view.addSubview(button2)
    }
    
    @objc func handleButton2() {
        //AppDelegate.nav.viewControllers = [MapViewController()]
    }
    
}

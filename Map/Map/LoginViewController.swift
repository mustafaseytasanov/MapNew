//
//  DemoViewController.swift
//  Map
//
//  Created by Nikita on 24.01.2022.
//

import UIKit


class LoginViewController: UIViewController {
        
    var tableView = UITableView()

    var flag = 1
    var allElements = [0, 0, 0, 0, 0]
    var allElementsTwo = [0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.register(TableViewFirstCell.self, forCellReuseIdentifier: "TableViewFirstCell")
        tableView.register(TableViewSecondCell.self, forCellReuseIdentifier: "TableViewSecondCell")
        tableView.register(TableViewThirdCell.self, forCellReuseIdentifier: "TableViewThirdCell")
        tableView.register(TableViewFourthCell.self, forCellReuseIdentifier: "TableViewFourthCell")
        tableView.separatorStyle = .none
        tableView.clipsToBounds = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(self.tableView)
    }
    
    func storeKeys() {
        userDefaults.setValue(login, forKey: "login")
        userDefaults.setValue(emailUp, forKey: "email")
        userDefaults.setValue(passwordUp, forKey: "password")
    }
    
}

extension LoginViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if flag == 1 {
            switch section {
            case 0:
                return 1
            case 1:
                return 4
            case 2:
                return 1
            case 3:
                return 1
            default:
                return 0
            }
        } else {
            switch section {
            case 0:
                return 1
            case 1:
                return 2
            case 2:
                return 1
            default:
                return 0
            }
        }
        

    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if flag == 1 {
            switch indexPath.section {
            case 0:
                let cell: TableViewFirstCell = tableView.dequeueReusableCell(withIdentifier: "TableViewFirstCell") as! TableViewFirstCell
                cell.configure(with: "")
                cell.delegate = self
                return cell
            case 1:
                let cell: TableViewSecondCell = tableView.dequeueReusableCell(withIdentifier: "TableViewSecondCell") as! TableViewSecondCell
                
                switch indexPath.row {
                case 0:
                    cell.configure(with: .login)
                case 1:
                    cell.configure(with: .email)
                case 2:
                    cell.configure(with: .password)
                default:
                    cell.configure(with: .repeatPassword)
                }
                cell.delegate = self
                return cell
            case 2:
                let cell: TableViewThirdCell = tableView.dequeueReusableCell(withIdentifier: "TableViewThirdCell") as! TableViewThirdCell
                cell.configure(with: "Согласен с правилами")
                cell.delegate = self
                return cell
            default:
                let cell: TableViewFourthCell = tableView.dequeueReusableCell(withIdentifier: "TableViewFourthCell") as! TableViewFourthCell
                cell.configure(with: "Зарегистрироваться")
                cell.delegate = self
                return cell
            }
        } else {
            switch indexPath.section {
            case 0:
                let cell: TableViewFirstCell = tableView.dequeueReusableCell(withIdentifier: "TableViewFirstCell") as! TableViewFirstCell
                cell.configure(with: "")
                cell.delegate = self
                return cell
            case 1:
                let cell: TableViewSecondCell = tableView.dequeueReusableCell(withIdentifier: "TableViewSecondCell") as! TableViewSecondCell
                switch indexPath.row {
                case 0:
                    cell.configure(with: .email)
                default:
                    cell.configure(with: .password)
                }
                cell.delegate = self
                return cell
            default:
                let cell: TableViewFourthCell = tableView.dequeueReusableCell(withIdentifier: "TableViewFourthCell") as! TableViewFourthCell
                cell.configure(with: "Войти")
                cell.delegate = self
                return cell
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if flag == 1 {
            return 4
        } else {
            return 3
        }
    }
    
}

extension LoginViewController: UITableViewDelegate {}

extension LoginViewController: TableViewFirstCellDelegate {
    
    func changedSegmnet(_ flag: Int) {
        self.flag = flag
        tableView.reloadData()
    }
    
    func getFlagValue() -> Int {
        return flag
    }
}

extension LoginViewController: TableViewSecondCellDelegate {
    
    func selectedIndex() -> Int {
        return flag
    }

    func arraySignup(index: Int, value: Int) {
        allElements[index] = value
    }
    
    func arraySignin(index: Int, value: Int) {
        allElementsTwo[index] = value
    }

}

extension LoginViewController: TableViewThirdCellDelegate {
    
    func updateArray(value: Int) {
        allElements[4] = value
    }
}


extension LoginViewController: TableViewFourthCellDelegate {
    
    func buttonSelectedFlag() {
        
        if flag == 1 {
            getArrayUp()
        } else {
            getArrayIn()
        }
        
    }
    
    func getArrayUp() {
        
        if allElements[0] == 1 && allElements[1] == 1 && allElements[2] == 1 && allElements[3] == 1 && allElements[4] == 1 {
            
            Navigation.nav.viewControllers = [MainViewController()]
            storeKeys()
            userDefaults.set(true, forKey: "isLoggedIn")
        }
    }
    
    func getArrayIn() {
        
        if allElementsTwo[0] == 1 && allElementsTwo[1] == 1 {
            Navigation.nav.viewControllers = [MainViewController()]
            userDefaults.set(true, forKey: "isLoggedIn")
        }
    }
    
   
}


//
//  DemoViewController.swift
//  Map
//
//  Created by Nikita on 24.01.2022.
//

import UIKit

var allElements = [0, 0, 0, 0, 0]
var allElementsTwo = [0, 0]
var flag = 1

class LoginViewController: UIViewController {
        
    var tableView = UITableView()
    
    var dataSource = DataSourceRegistration()
    var dataSourceTwo = DataSourceSignin()
    var authTableHeader = AuthTableHeader()
    var authTableFooter = AuthTableFooter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.register(TableViewInputCell.self, forCellReuseIdentifier: "TableViewInputCell")
        tableView.separatorStyle = .none
        tableView.clipsToBounds = false
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.dataSource = dataSource
        tableView.tableHeaderView = authTableHeader.myHeaderView()
        tableView.tableFooterView = authTableFooter.myFooterOneView()
        authTableHeader.delegate = self
        authTableFooter.delegate = self
        self.view.addSubview(self.tableView)
    }

}


extension LoginViewController: HeaderDelegate {
    
    func segmentChanged(param: UISegmentedControl) {
        flag = param.selectedSegmentIndex
        tableView.reloadData()
        if flag == 1 {
            tableView.dataSource = dataSource
            tableView.tableFooterView = authTableFooter.myFooterOneView()
        } else {
            tableView.dataSource = dataSourceTwo
            tableView.tableFooterView = authTableFooter.myFooterTwoView()
        }
    }
}


extension LoginViewController: FooterDelegate {
    
    func switchUp(param: UISwitch) {
        if param.isOn {
            allElements[4] = 1
        } else {
            allElements[4] = 0
        }
    }
    
    func buttonSelected(param: UIButton) {
        
        if flag == 1 {
            if allElements[0] == 1 && allElements[1] == 1 && allElements[2] == 1 && allElements[3] == 1 && allElements[4] == 1 {
                
                Navigation.nav.viewControllers = [MainViewController()]
                LoginManager.login = login
                LoginManager.email = emailUp
                LoginManager.password = passwordUp
                LoginManager.isLoggedIn = true
            }
        } else {
            if allElementsTwo[0] == 1 && allElementsTwo[1] == 1 {
                Navigation.nav.viewControllers = [MainViewController()]
                LoginManager.isLoggedIn = true
            }
        }
    }
}

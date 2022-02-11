//
//  DemoViewController.swift
//  Map
//
//  Created by Nikita on 24.01.2022.
//

import UIKit

class LoginViewController: UIViewController {
        
    var tableView = UITableView()
    let object = LoginViewModel()
    var flag = 1
    var allElements = [0, 0, 0, 0, 0]
    var allElementsTwo = [0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.register(TableViewInputCell.self, forCellReuseIdentifier: "TableViewInputCell")
        tableView.separatorStyle = .none
        tableView.clipsToBounds = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.headerView(forSection: 0)
        tableView.footerView(forSection: 2)
        self.view.addSubview(self.tableView)
    }
    
    
    func storeKeys() {
        UserDefaults.standard.setValue(login, forKey: "login")
        UserDefaults.standard.setValue(emailUp, forKey: "email")
        UserDefaults.standard.setValue(passwordUp, forKey: "password")
    }
    
}

extension LoginViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if flag == 1 {
            return 4
        } else {
            return 2
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if flag == 1 {
        
            let cell: TableViewInputCell = tableView.dequeueReusableCell(withIdentifier: "TableViewInputCell") as! TableViewInputCell
            
            cell.configure(with: object.elements[indexPath.row])
            cell.delegate = self
            return cell

        } else {
            let cell: TableViewInputCell = tableView.dequeueReusableCell(withIdentifier: "TableViewInputCell") as! TableViewInputCell
            
            cell.configure(with: object.elementsTwo[indexPath.row])
            cell.delegate = self
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}

extension LoginViewController: UITableViewDelegate {}

extension LoginViewController: TableViewInputCellDelegate {
    
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

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
    
    var dataSource = DataSourceRegistration()
    var dataSourceTwo = DataSourceSignin()
    
    var header = Header()
    var footer = Footer()
    
    let head = UIView()
    var segment = UISegmentedControl()
    
    let foot = UIView()
    var label = UILabel()
    var switchh = UISwitch()
    var button = UIButton()
    
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
        //tableView.dataSource = dataSourceTwo

        head.frame = CGRect(x: 0, y: 0, width: 0, height: 100)
        segment = header.segmentControl
        head.addSubview(segment)
        setupHeaderUI()
        tableView.tableHeaderView = head
        
        foot.frame = CGRect(x: 0, y: 0, width: 0, height: 200)
        label = footer.label
        foot.addSubview(label)
        switchh = footer.switchOption
        foot.addSubview(switchh)
        button = footer.buttonOk
        foot.addSubview(button)
        setupFooterUI()
        tableView.tableFooterView = foot
        
        
        
        self.view.addSubview(self.tableView)
        
    }
    
    
    func setupHeaderUI() {
        head.translatesAutoresizingMaskIntoConstraints = false
        segment.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segment.heightAnchor.constraint(equalToConstant: 40),
            segment.topAnchor.constraint(equalTo: head.topAnchor, constant: 0),
            segment.bottomAnchor.constraint(equalTo: head.bottomAnchor, constant: 0),
            segment.leadingAnchor.constraint(equalTo: head.leadingAnchor, constant: 16),
            segment.trailingAnchor.constraint(equalTo: head.trailingAnchor, constant: -16),
            
        ])
    }
    
    func setupFooterUI() {
        foot.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        switchh.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.heightAnchor.constraint(equalToConstant: 40),
            label.topAnchor.constraint(equalTo: foot.topAnchor, constant: 200),
            label.bottomAnchor.constraint(equalTo: foot.bottomAnchor, constant: 0),
            label.leadingAnchor.constraint(equalTo: foot.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: foot.trailingAnchor, constant: -16),
            switchh.heightAnchor.constraint(equalToConstant: 40),
            switchh.topAnchor.constraint(equalTo: foot.topAnchor, constant: 300),
            switchh.bottomAnchor.constraint(equalTo: foot.bottomAnchor, constant: 0),
            switchh.leadingAnchor.constraint(equalTo: foot.leadingAnchor, constant: UIScreen.main.bounds.width - switchh.bounds.width-16),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.topAnchor.constraint(equalTo: foot.topAnchor, constant: 400),
            button.bottomAnchor.constraint(equalTo: foot.bottomAnchor, constant: 0),
            button.leadingAnchor.constraint(equalTo: foot.leadingAnchor, constant: 32),
            button.trailingAnchor.constraint(equalTo: foot.trailingAnchor, constant: -32),
        ])
    }
    
    
    
    
    func storeKeys() {
        UserDefaults.standard.setValue(login, forKey: "login")
        UserDefaults.standard.setValue(emailUp, forKey: "email")
        UserDefaults.standard.setValue(passwordUp, forKey: "password")
    }
}





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

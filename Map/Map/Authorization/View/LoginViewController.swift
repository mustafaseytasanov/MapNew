//
//  DemoViewController.swift
//  Map
//
//  Created by Nikita on 24.01.2022.
//

import UIKit

var allElements = [false, false, false, false, false]
var allElementsTwo = [false, false]
var flag = 1

class LoginViewController: UIViewController {
        
    var tableView = UITableView()
    
    var dataSource = DataSourceRegistration()
    var dataSourceTwo = DataSourceSignin()
    var authTableHeader = AuthTableHeader()
    var authTableFooter = AuthTableFooter()
    
    var viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bind()
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
    
    private func bind() {
        
        viewModel.checkingText()
        //print(res)
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


extension LoginViewController: AuthTableFooterDelegate {
    
    func buttonHandleUp(param: UIButton) {
        
        viewModel.checkingText()

        /*
        if allElements[0] == true && allElements[1] == true && allElements[2] == true && allElements[3] == true && allElements[4] == true {
            
            Navigation.nav.viewControllers = [MainViewController()]
            
            LoginManager.login = login
            LoginManager.email = emailUp
            LoginManager.password = passwordUp
            LoginManager.isLoggedIn = true
            
        }*/
    }
}

//
//  DemoViewController.swift
//  Map
//
//  Created by Nikita on 24.01.2022.
//

import UIKit
import SnapKit

var flag = 1

class LoginViewController: UIViewController  {
            
    var tableView = UITableView()
    var dataSource = DataSourceRegistration()
    var dataSourceTwo = DataSourceSignin()
    var authTableHeader = AuthTableHeader()
    var authTableFooter = AuthTableFooter()
    
    var viewModel: LoginViewModel
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        //self.hidesBottomBarWhenPushed = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //viewModel.reload()
        setupTableView()
        bindViewModel()
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
        dataSource.delegate = self
        self.view.addSubview(self.tableView)
    }
    
    private func bindViewModel() {
        
        viewModel.login.bind({ (helloText) in
            DispatchQueue.main.async {}
        })
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
        let validationValue = viewModel.checkingText()
        if validationValue == false {
            tableView.reloadData()
        }
    }
    
    func buttonHandleIn(param: UIButton) {
        viewModel.checkingTextTwo()
    }
    
    func valueSwitchChanged(param: UISwitch) {
        if param.isOn {
            viewModel.valueSwitch(true)
        } else {
            viewModel.valueSwitch(false)
        }
    }
}

extension LoginViewController: DataSourceRegistrationDelegate {
    
    func moveToController(text: String, type: Enum) {
        viewModel.updateValues(text: text, cellType: type)
    }
    
    func getArray() -> (array: [Bool], signUpData: [String]) {
        return viewModel.getBoolArray()
    }
}

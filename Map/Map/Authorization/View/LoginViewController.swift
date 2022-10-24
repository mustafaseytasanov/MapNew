//
//  DemoViewController.swift
//  Map
//
//  Created by Nikita on 24.01.2022.
//

import UIKit
import SnapKit


class LoginViewController: UIViewController  {
                
    private let tableView = UITableView()    
    let dataSource = DataSourceRegistration()
    let dataSourceTwo = DataSourceSignin()
    let authTableHeader = AuthTableHeader(view: UIView())
    let authTableFooter = AuthTableFooter(viewForSignUp: UIView(),
                                          viewForSignIn: UIView())
    private let viewModel: LoginViewModel
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = .white
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.frame = view.bounds
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
}


extension LoginViewController: HeaderDelegate {
        
    func segmentChanged(segmentControlIndex: Int) {
        viewModel.segmentedControlSelectedIndex = segmentControlIndex
        tableView.reloadData()
        if viewModel.segmentedControlSelectedIndex == 1 {
            tableView.dataSource = dataSource
            tableView.tableFooterView = authTableFooter.myFooterOneView()
        } else {
            tableView.dataSource = dataSourceTwo
            tableView.tableFooterView = authTableFooter.myFooterTwoView()
        }
    }
}


extension LoginViewController: AuthTableFooterDelegate {
    
    func buttonHandleUp() {
        let validationValue = viewModel.signUpValidation()
        if validationValue == false {
            tableView.reloadData()
        }
    }
    
    func buttonHandleIn() {
        viewModel.userAuthorization()
    }
    
    func valueSwitchChanged(value: Bool) {

        if value {
            viewModel.valueSwitch(true)
        } else {
            viewModel.valueSwitch(false)
        }
    }
}

extension LoginViewController: DataSourceRegistrationDelegate {
    
    func moveToController(text: String, type: CellIndices) {
        viewModel.updateValues(text: text, cellType: type)
    }
    
    func getArray() -> (array: [Bool], signUpData: [String]) {
        return viewModel.getValidArrayAndSignUpData()
    }
}

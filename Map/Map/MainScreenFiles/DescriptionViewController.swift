//
//  DescriptionViewController.swift
//  Map
//
//  Created by Nikita on 04.02.2022.
//

import UIKit
import SnapKit

class DescriptionViewController: UIViewController {
    
    var tableView = UITableView()

    var viewModel: DemoViewModel
    init(viewModel: DemoViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        //self.hidesBottomBarWhenPushed = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        setupNavigationBar()
        viewModel.reload()
        
    }
    

    private func setupTableView() {
        tableView = UITableView(frame: CGRect(
            x: 0, y: -64, width: UIScreen.main.bounds.width,
            height: UIScreen.main.bounds.height + 64), style: .plain)
        tableView.register(CellOne.self, forCellReuseIdentifier: "CellOne")
        tableView.register(CellTwo.self, forCellReuseIdentifier: "CellTwo")
        tableView.register(CellThree.self, forCellReuseIdentifier: "CellThree")
        tableView.register(CellFour.self, forCellReuseIdentifier: "CellFour")
        tableView.separatorStyle = .none
        tableView.clipsToBounds = false
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.dataSource = self
        tableView.backgroundColor = .lightGray
        self.view.addSubview(self.tableView)
    }
    
    
    func setupNavigationBar() {
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = .orange
        let item1 = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: nil)
        let item2 = UIBarButtonItem(
            image: UIImage(named: "option-2"),
            style: .done,
            target: self,
            action: nil)
        self.navigationItem.rightBarButtonItems = [item1, item2]
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "left-3"),
            style: .done,
            target: self,
            action: nil)
    }
}


extension DescriptionViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell: CellOne = tableView.dequeueReusableCell(withIdentifier: "CellOne") as! CellOne
            return cell
        case 1:
            let cell: CellTwo = tableView.dequeueReusableCell(withIdentifier: "CellTwo") as! CellTwo
            return cell
        case 2:
            let cell: CellThree = tableView.dequeueReusableCell(withIdentifier: "CellThree") as! CellThree
            return cell
        default:
            let cell: CellFour = tableView.dequeueReusableCell(withIdentifier: "CellFour") as! CellFour
            return cell
        }
    }
}

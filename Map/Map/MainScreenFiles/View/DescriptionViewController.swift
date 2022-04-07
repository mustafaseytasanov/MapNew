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
    
    var viewModel: DescriptionViewModel
    init(viewModel: DescriptionViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeRequests()
        
        viewModel.readySetupContent = {
            self.setupTableView()
            self.setupNavigationBar()
        }
        
    }
    
    func makeRequests() {
        
        viewModel.requestTwo()
        viewModel.waiting = {
            
            imageViewArray = []
            
            var idx = 0
            if self.viewModel.dataStorage.count > 0 {
                let path = self.viewModel.dataStorage[idx].prefix + "original" +
                    self.viewModel.dataStorage[idx].suffix
                self.viewModel.requestThree(from: path)
                idx += 1
            }
            
            self.viewModel.waitingTwo = {
                if idx <= self.viewModel.dataStorage.count-1 {
                    let path = self.viewModel.dataStorage[idx].prefix + "original" +
                        self.viewModel.dataStorage[idx].suffix
                    self.viewModel.requestThree(from: path)
                    idx += 1
                } else {
                    self.viewModel.readySetupContent()
                }
            }
        }
    }
    
    
    private func setupTableView() {
        tableView = UITableView(frame: CGRect(
            x: 0, y: -64, width: UIScreen.main.bounds.width,
            height: UIScreen.main.bounds.height + 64), style: .plain)
        tableView.register(CellOne.self, forCellReuseIdentifier: "CellOne")
        tableView.register(CellTwo.self, forCellReuseIdentifier: "CellTwo")
        tableView.register(CellThree.self, forCellReuseIdentifier: "CellThree")
        tableView.register(CellFour.self, forCellReuseIdentifier: "CellFour")
        tableView.register(CellFive.self, forCellReuseIdentifier: "CellFive")
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
        let item1 = UIBarButtonItem(barButtonSystemItem: .action,
                                    target: self,
                                    action: nil)
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
            action: #selector(handleButtonBack))
    }
    
    @objc func handleButtonBack() {
        viewModel.toMap()
    }
    
}


extension DescriptionViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell: CellOne = tableView.dequeueReusableCell(withIdentifier: "CellOne") as! CellOne
            let model = viewModel.dataFromMap
            cell.configure(with: model)
            return cell
        case 1:
            let cell: CellTwo = tableView.dequeueReusableCell(withIdentifier: "CellTwo") as! CellTwo
            return cell
        case 2:
            let cell: CellThree = tableView.dequeueReusableCell(withIdentifier: "CellThree") as! CellThree
            return cell
        case 3:
            let cell: CellFour = tableView.dequeueReusableCell(withIdentifier: "CellFour") as! CellFour
            let model = viewModel.dataFromMap
            cell.configure(with: model)
            return cell
        default:
            let cell: CellFive = tableView.dequeueReusableCell(withIdentifier: "CellFive") as! CellFive
            cell.delegate = self
            return cell
        }
    }
}

extension DescriptionViewController: LogOutDelegate {
    func updateClosure() {
        viewModel.toLogin()
    }
}

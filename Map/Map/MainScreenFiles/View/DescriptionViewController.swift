//
//  DescriptionViewController.swift
//  Map
//
//  Created by Nikita on 04.02.2022.
//

import UIKit
import SnapKit

class DescriptionViewController: UIViewController {
    
    private let tableView = UITableView()
    private let viewModel: DescriptionViewModel
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
        
        var idx = 0
        viewModel.imageViewArray = []
        viewModel.waiting = {
            
            if self.viewModel.dataStorage.count > 0 {
                let path = self.viewModel.dataStorage[idx].prefix + "original" +
                    self.viewModel.dataStorage[idx].suffix
                idx += 1
                self.viewModel.requestThree(from: path)
            }
        }
            
        viewModel.waitingTwo = {
            if idx <= self.viewModel.dataStorage.count-1 {
                let path = self.viewModel.dataStorage[idx].prefix + "original" +
                    self.viewModel.dataStorage[idx].suffix
                idx += 1
                self.viewModel.requestThree(from: path)
            } else {
                self.viewModel.readySetupContent()
            }
        }
    }
    
    
    private func setupTableView() {
        tableView.frame = CGRect(x: 0,
                                 y: -64,
                                 width: UIScreen.main.bounds.width,
                                 height: UIScreen.main.bounds.height + 64)
        tableView.register(CellWithPhotos.self, forCellReuseIdentifier: "CellWithPhotos")
        tableView.register(CellWithButtons.self, forCellReuseIdentifier: "CellWithButtons")
        tableView.register(CellWithHexagon.self, forCellReuseIdentifier: "CellWithHexagon")
        tableView.register(InformationCell.self, forCellReuseIdentifier: "InformationCell")
        tableView.register(LogOutCell.self, forCellReuseIdentifier: "LogOutCell")
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
            let cell: CellWithPhotos = tableView.dequeueReusableCell(withIdentifier: "CellWithPhotos") as! CellWithPhotos
            let model = viewModel.dataFromMapMainData
            cell.configure(with: model,
                           currentTag: viewModel.dataFromMapCurrentTag,
                           arrayOfPhotos: viewModel.imageViewArray)
            return cell
        case 1:
            let cell: CellWithButtons = tableView.dequeueReusableCell(withIdentifier: "CellWithButtons") as! CellWithButtons
            return cell
        case 2:
            let cell: CellWithHexagon = tableView.dequeueReusableCell(withIdentifier: "CellWithHexagon") as! CellWithHexagon
            return cell
        case 3:
            let cell: InformationCell = tableView.dequeueReusableCell(withIdentifier: "InformationCell") as! InformationCell
            let model = viewModel.dataFromMapMainData
            cell.configure(with: model, currentTag: viewModel.dataFromMapCurrentTag)
            return cell
        default:
            let cell: LogOutCell = tableView.dequeueReusableCell(withIdentifier: "LogOutCell") as! LogOutCell
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

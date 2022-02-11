//
//  DescriptionViewController.swift
//  Map
//
//  Created by Nikita on 04.02.2022.
//

import UIKit
import MapKit

class DescriptionViewController: UIViewController {

    var tableView2 = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: nil)
        setupTableView()
    }
                                                                 
                                                                 
    func setupTableView() {
        //tableView2 = UITableView(frame: view.bounds, style: .plain)
        tableView2 = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        tableView2.register(TableViewCellOne.self, forCellReuseIdentifier: "TableViewCellOne")
        tableView2.separatorStyle = .none
        tableView2.clipsToBounds = false
        tableView2.dataSource = self
        tableView2.delegate = self
        tableView2.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(self.tableView2)
    }

}

extension DescriptionViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TableViewCellOne = tableView2.dequeueReusableCell(withIdentifier: "TableViewCellOne") as! TableViewCellOne
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
}

extension DescriptionViewController: UITableViewDelegate {}

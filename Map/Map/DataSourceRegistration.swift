//
//  DataSourceRegistration.swift
//  Map
//
//  Created by Nikita on 14.02.2022.
//

import UIKit

class DataSourceRegistration: NSObject {
    let object = LoginViewModel()
}

extension DataSourceRegistration: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TableViewInputCell = tableView.dequeueReusableCell(withIdentifier: "TableViewInputCell") as! TableViewInputCell
        
        cell.configure(with: object.elements[indexPath.row])
        cell.delegate = self
        return cell
    }
}


extension DataSourceRegistration: TableViewInputCellDelegate {
    
    func arraySignin(index: Int, value: Int) {}

    func arraySignup(index: Int, value: Int) {
        allElements[index] = value
    }

}

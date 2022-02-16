//
//  DataSourceRegistration.swift
//  Map
//
//  Created by Nikita on 14.02.2022.
//

import UIKit

class DataSourceRegistration: NSObject {
    let object = LoginViewModel()
    static var arrayTextFieldElements = ["", "", "", ""]
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
    
    func textChanged(text: String, cellType: Enum) {
        
        switch cellType {
        case .login:
            DataSourceRegistration.arrayTextFieldElements[0] = text
        case .email:
            DataSourceRegistration.arrayTextFieldElements[1] = text
        case .password:
            DataSourceRegistration.arrayTextFieldElements[2] = text
        case .repeatPassword:
            DataSourceRegistration.arrayTextFieldElements[3] = text
        }
    }
}

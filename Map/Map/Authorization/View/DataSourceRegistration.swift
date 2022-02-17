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
    
    func textFieldColor() {
        
    }
    
    func textChanged(text: String, cellType: Enum) {
        
        if flag == 1 {
            switch cellType {
            case .login:
                login = text
            case .email:
                emailUp = text
            case .password:
                passwordUp = text
            case .repeatPassword:
                repeatPassword = text
            }
        } else {
            switch cellType {
            case .email:
                emailIn = text
            case .password:
                passwordIn = text
            default:
                break
            }
        }
        
    }
}

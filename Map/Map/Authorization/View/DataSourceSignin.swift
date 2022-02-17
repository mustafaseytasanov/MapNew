//
//  DataSourceSignin.swift
//  Map
//
//  Created by Nikita on 14.02.2022.
//

import UIKit

class DataSourceSignin: NSObject {
    let object = LoginViewModel()
}

extension DataSourceSignin: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TableViewInputCell = tableView.dequeueReusableCell(withIdentifier: "TableViewInputCell") as! TableViewInputCell
            
        cell.configure(with: object.elementsTwo[indexPath.row])
        cell.delegate = self
        return cell
    }
}

extension DataSourceSignin: TableViewInputCellDelegate {
    
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




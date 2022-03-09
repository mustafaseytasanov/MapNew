//
//  DataSourceRegistration.swift
//  Map
//
//  Created by Nikita on 14.02.2022.
//

import UIKit


protocol DataSourceRegistrationDelegate: AnyObject {
    func moveToController(text: String, type: Enum)
    func getArray() -> (array: [Bool], signUpData: [String])
}

class DataSourceRegistration: NSObject {
    let object = LoginViewModel()
    weak var delegate: DataSourceRegistrationDelegate?
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

    func textChange(type: Enum, text: String) {
        delegate?.moveToController(text: text, type: type)
    }
    
    func getBoolArray() -> (array: [Bool], signUpData: [String]) {
        if let callFunction = delegate?.getArray() {
            return callFunction
        }
        return ([], [])
    }
}

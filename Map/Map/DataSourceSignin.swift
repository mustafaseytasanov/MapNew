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
        
    func arraySignin(index: Int, value: Int) {
        allElementsTwo[index] = value
    }

    func arraySignup(index: Int, value: Int) {}
    
}

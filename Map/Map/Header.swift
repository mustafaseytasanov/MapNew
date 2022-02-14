//
//  Header.swift
//  Map
//
//  Created by Nikita on 14.02.2022.
//

import UIKit

class Header: UIView {

    
    var segmentControl: UISegmentedControl = {
        var segment = UISegmentedControl()
        let arrayOptions = ["Вход", "Регистрация"]
        segment = UISegmentedControl(items: arrayOptions)
        segment.selectedSegmentTintColor = UIColor.init(red: 0.5, green: 0.8, blue: 1, alpha: 1)
        segment.backgroundColor = UIColor.white
        segment.selectedSegmentIndex = 1
        return segment
    }()
    
    
    func setupHeader() {        
        segmentControl.addTarget(self, action: #selector(segmentChanged(param:)), for: .valueChanged)
    }
    
    
    @objc func segmentChanged(param: UISegmentedControl) {
        //flag = param.selectedSegmentIndex
        //tableView.reloadData()
        //if flag == 1 {
        //    setupFooterOne()
        //} else {
        //    setupFooterZero()
        //}
    }
    
}

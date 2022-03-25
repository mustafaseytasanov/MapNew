//
//  Header.swift
//  Map
//
//  Created by Nikita on 14.02.2022.
//

import UIKit


protocol HeaderDelegate: AnyObject {
    func segmentChanged(param: UISegmentedControl)
}


class AuthTableHeader: UIView {

    weak var delegate: HeaderDelegate?
    
    var segmentControl: UISegmentedControl = {
        var segment = UISegmentedControl()
        let arrayOptions = ["Sign in".localized, "Sign up".localized]
        segment = UISegmentedControl(items: arrayOptions)
        segment.selectedSegmentTintColor = UIColor.init(red: 0.5, green: 0.8, blue: 1, alpha: 1)
        segment.backgroundColor = UIColor.white
        segment.selectedSegmentIndex = 1
        return segment
    }()
    
    func myHeaderView() -> UIView {
        let viewHeader = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60))
        viewHeader.addSubview(segmentControl)
        segmentControl.addTarget(self, action: #selector(segmentHandle(param:)), for: .valueChanged)
        viewHeader.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentControl.heightAnchor.constraint(equalToConstant: 40),
            segmentControl.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-40),
            segmentControl.topAnchor.constraint(equalTo: viewHeader.topAnchor, constant: 10),
            segmentControl.bottomAnchor.constraint(equalTo: viewHeader.bottomAnchor, constant: -10),
            segmentControl.leadingAnchor.constraint(equalTo: viewHeader.leadingAnchor, constant: 20),
            segmentControl.trailingAnchor.constraint(equalTo: viewHeader.trailingAnchor, constant: -20)
        ])
        return viewHeader
    }
    
    @objc func segmentHandle(param: UISegmentedControl) {
        delegate?.segmentChanged(param: segmentControl)
    }

}

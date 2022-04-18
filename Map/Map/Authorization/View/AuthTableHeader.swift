//
//  Header.swift
//  Map
//
//  Created by Nikita on 14.02.2022.
//

import UIKit

protocol HeaderDelegate: AnyObject {
    func segmentChanged(segmentControlIndex: Int)
}

class AuthTableHeader: UIView {

    weak var delegate: HeaderDelegate?
    
    private let view: UIView
    init(view: UIView) {
        self.view = view
        super.init(frame: CGRect())
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Sign in".localized,
                                                 "Sign up".localized])
        segment.selectedSegmentTintColor = UIColor.init(red: 0.5, green: 0.8, blue: 1, alpha: 1)
        segment.backgroundColor = UIColor.white
        segment.selectedSegmentIndex = 1
        return segment
    }()
    
    func myHeaderView() -> UIView {
        
        view.frame = CGRect(x: 0,
                            y: 0,
                            width: UIScreen.main.bounds.width,
                            height: 60)
        view.addSubview(segmentControl)
        segmentControl.addTarget(self, action: #selector(segmentHandle(param:)), for: .valueChanged)

        // UI
        view.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentControl.heightAnchor.constraint(equalToConstant: 40),
            segmentControl.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-40),
            segmentControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            segmentControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            segmentControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        return view
    }
    
    @objc func segmentHandle(param: UISegmentedControl) {
        let index = param.selectedSegmentIndex
        delegate?.segmentChanged(segmentControlIndex: index)
    }

}

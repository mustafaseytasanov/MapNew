//
//  SegmentedControlTableViewCell.swift
//  Map
//
//  Created by Nikita on 28.01.2022.
//

import UIKit

protocol TableViewFirstCellDelegate: AnyObject {
    func changedSegmnet(_ flag: Int)
    func getFlagValue() -> Int
}

final class TableViewFirstCell: UITableViewCell {
    
    weak var delegate: TableViewFirstCellDelegate?

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var colorView: UIView = {
        let view = UIView()
        return view
    }()
    
    private var buttonOk: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private var segmentControl: UISegmentedControl = {
        var segment = UISegmentedControl()
        let arrayOptions = ["Вход", "Регистрация"]
        segment = UISegmentedControl(items: arrayOptions)
        segment.selectedSegmentTintColor = UIColor.init(red: 0.5, green: 0.8, blue: 1, alpha: 1)
        segment.backgroundColor = UIColor.white
        segment.selectedSegmentIndex = 1
        return segment
    }()
    
    
    func configure(with title: String) {
        segmentControl.addTarget(self, action: #selector(segmentChanged(param:)), for: .valueChanged)
    }

    @objc func segmentChanged(param: UISegmentedControl) {
        delegate?.changedSegmnet(param.selectedSegmentIndex)
    }
    
    func setupUI() {
        selectionStyle = .none
        colorView.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(colorView)
        colorView.addSubview(segmentControl)
        NSLayoutConstraint.activate([
            colorView.heightAnchor.constraint(equalToConstant: 72),
            colorView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            colorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            colorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            colorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            segmentControl.heightAnchor.constraint(equalToConstant: 56),
            segmentControl.topAnchor.constraint(equalTo: colorView.topAnchor, constant: 8),
            segmentControl.bottomAnchor.constraint(equalTo: colorView.bottomAnchor, constant: -8),
            segmentControl.leadingAnchor.constraint(equalTo: colorView.leadingAnchor, constant: 24),
            segmentControl.trailingAnchor.constraint(equalTo: colorView.trailingAnchor, constant: -24)

        ])
    }
}



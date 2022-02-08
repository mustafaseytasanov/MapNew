//
//  TableViewFourthCell.swift
//  Map
//
//  Created by Nikita on 31.01.2022.
//

import UIKit

protocol TableViewThirdCellDelegate: AnyObject {
    func updateArray(value: Int)
}


final class TableViewThirdCell: UITableViewCell {

    weak var delegate: TableViewThirdCellDelegate?
    
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
    
    private var label: UILabel = {
        let labelText = UILabel()
        labelText.font = UIFont.systemFont(ofSize: 22)
        return labelText
    }()
    
    private var switchOption: UISwitch = {
        let switchh = UISwitch()
        return switchh
    }()
    
    
    func configure(with title: String) {
        label.text = title
        switchOption.addTarget(self, action: #selector(handleSwitchUp(param:)), for: .valueChanged)
    }

    @objc func handleSwitchUp(param: UISwitch) {
        if param.isOn {
            delegate?.updateArray(value: 1)
        } else {
            delegate?.updateArray(value: 0)
        }
    }
    
    
    func setupUI() {
        selectionStyle = .none
        colorView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        switchOption.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(colorView)
        colorView.addSubview(label)
        colorView.addSubview(switchOption)
        NSLayoutConstraint.activate([
            colorView.heightAnchor.constraint(equalToConstant: 40),
            colorView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            colorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            colorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            colorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            label.heightAnchor.constraint(equalToConstant: 32),
            label.topAnchor.constraint(equalTo: colorView.topAnchor, constant: 4),
            label.bottomAnchor.constraint(equalTo: colorView.bottomAnchor, constant: -4),
            label.leadingAnchor.constraint(equalTo: colorView.leadingAnchor, constant: 8),            
            switchOption.heightAnchor.constraint(equalToConstant: 32),
            switchOption.topAnchor.constraint(equalTo: colorView.topAnchor, constant: 4),
            switchOption.bottomAnchor.constraint(equalTo: colorView.bottomAnchor, constant: -4),
            switchOption.trailingAnchor.constraint(equalTo: colorView.trailingAnchor, constant: -8)
        ])
    }
}

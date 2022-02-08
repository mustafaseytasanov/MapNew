//
//  XibTableViewCell.swift
//  Map
//
//  Created by Nikita on 27.01.2022.
//


import UIKit

protocol TableViewFourthCellDelegate: AnyObject {
    func getArrayUp()
    func getArrayIn()
    func buttonSelectedFlag()
}

final class TableViewFourthCell: UITableViewCell {
    
    weak var delegate: TableViewFourthCellDelegate?
    
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
    
    func configure(with title: String) {
        buttonOk.backgroundColor = UIColor.white
        buttonOk.setTitle(title, for: .normal)
        buttonOk.setTitleColor(.blue, for: .normal)
        buttonOk.addTarget(self, action: #selector(buttonSelected(param:)), for: .touchUpInside)
    }

    @objc func buttonSelected(param: UIButton) {
        delegate?.buttonSelectedFlag()
    }
    
    
    func setupUI() {
        selectionStyle = .none
        colorView.translatesAutoresizingMaskIntoConstraints = false
        buttonOk.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(colorView)
        colorView.addSubview(buttonOk)
        NSLayoutConstraint.activate([
            colorView.heightAnchor.constraint(equalToConstant: 32),
            colorView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            colorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            colorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            colorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            buttonOk.heightAnchor.constraint(equalToConstant: 24),
            buttonOk.topAnchor.constraint(equalTo: colorView.topAnchor, constant: 4),
            buttonOk.bottomAnchor.constraint(equalTo: colorView.bottomAnchor, constant: -4),
            //buttonOk.leadingAnchor.constraint(equalTo: colorView.leadingAnchor, constant: 8),
            //buttonOk.trailingAnchor.constraint(equalTo: colorView.trailingAnchor, constant: -8)
            buttonOk.centerXAnchor.constraint(equalTo: colorView.centerXAnchor)
        ])
    }
}


//
//  TableViewCellOne.swift
//  Map
//
//  Created by Nikita on 04.02.2022.
//

import UIKit

protocol TableViewCellOneDelegate: AnyObject {

}

final class TableViewCellOne: UITableViewCell {
    
    //weak var delegate: TableViewCellOneDelegate?
    
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
        
    }


    func setupUI() {
        selectionStyle = .none
        colorView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(colorView)
        
        NSLayoutConstraint.activate([
            colorView.heightAnchor.constraint(equalToConstant: 72),
            colorView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            colorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            colorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            colorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            

        ])
    }
}


//
//  CellOne.swift
//  Map
//
//  Created by Nikita on 28.02.2022.
//

import UIKit

class CellWithHexagon: UITableViewCell {


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    private let labelText: UILabel = {
        let label = UILabel()
        label.text = "Have you been to this place".localized
        label.textColor = .gray
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    private let buttonHexagon: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.clear
        let aPath = UIBezierPath()
        aPath.move(to: CGPoint(x: 14.0, y: 4.0))
        aPath.addLine(to: CGPoint(x: 4.0, y: 10.0))
        aPath.addLine(to: CGPoint(x: 4.0, y: 20.0))
        aPath.addLine(to: CGPoint(x: 14.0, y: 26.0))
        aPath.addLine(to: CGPoint(x: 24.0, y: 20.0))
        aPath.addLine(to: CGPoint(x: 24.0, y: 10.0))
        aPath.close()
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.orange.cgColor
        layer.strokeColor = UIColor.orange.cgColor
        layer.path = aPath.cgPath
        button.layer.addSublayer(layer)
        button.setTitle("D", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 13.5)
        return button
    }()
    
    
    
    private let imageView1: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "next")
        imageView.image = image
        return imageView
    }()
    
    private let buttonArrow = UIButton()
    
    private let colorView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    // UI
    func setupUI() {
        selectionStyle = .none
        contentView.backgroundColor = .lightGray

        contentView.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(
                width: UIScreen.main.bounds.width, height: 80))
        }
        contentView.addSubview(colorView)
        colorView.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: UIScreen.main.bounds.width,
                                     height: 60))
            make.edges.equalTo(contentView).inset(
                UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
        }
        colorView.addSubview(labelText)
        labelText.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(colorView).offset(10)
            make.left.equalTo(colorView).offset(16)
        }
        colorView.addSubview(buttonHexagon)
        buttonHexagon.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(colorView).offset(25)
            make.left.equalTo(colorView).offset(16)
        }
        colorView.addSubview(buttonArrow)
        buttonArrow.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: 20, height: 20))
            make.top.equalTo(colorView).offset(30)
            make.left.equalTo(colorView).offset(UIScreen.main.bounds.width - 36)
        }
        buttonArrow.addSubview(imageView1)
        imageView1.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: 20, height: 20))
            make.top.equalTo(buttonArrow).offset(0)
            make.left.equalTo(buttonArrow).offset(0)
        }
        
    }
}


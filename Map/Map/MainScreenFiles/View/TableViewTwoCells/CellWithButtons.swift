//
//  CellTwo.swift
//  Map
//
//  Created by Nikita on 28.02.2022.
//

import UIKit

class CellWithButtons: UITableViewCell {


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    private let colorView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let button1: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.backgroundColor = .blue
        return button
    }()
    
    private let imageView1: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "save-instagram-2")
        imageView.image = image
        return imageView
    }()
    
    private let label1: UILabel = {
        let label = UILabel()
        label.text = "Save".localized
        label.textColor = .blue
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 14.0)
        return label
    }()
    
    private let button2: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.backgroundColor = .blue
        return button
    }()
    
    private let imageView2: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "love-2")
        imageView.image = image
        return imageView
    }()
    
    private let label2: UILabel = {
        let label = UILabel()
        label.text = "Like".localized
        label.textColor = .blue
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
        return label
    }()
    //
    private let button3: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.backgroundColor = .blue
        return button
    }()
    
    private let imageView3: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "writing")
        imageView.image = image
        return imageView
    }()
    
    private let label3: UILabel = {
        let label = UILabel()
        label.text = "Write a Tip".localized
        label.textColor = .blue
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 14.0)
        return label
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
                width: UIScreen.main.bounds.width, height: 120))
        }
        contentView.addSubview(colorView)
        colorView.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: UIScreen.main.bounds.width,
                                     height: 100))
            make.edges.equalTo(contentView).inset(UIEdgeInsets(
                top: 10, left: 0, bottom: 10, right: 0))
        }
        colorView.addSubview(button1)
        colorView.addSubview(button2)
        colorView.addSubview(button3)
        button1.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: 50, height: 50))
            make.top.equalTo(colorView).offset(15)
            make.left.equalTo(colorView).offset(50)
        }
        button1.addSubview(imageView1)
        imageView1.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: 20, height: 20))
            make.top.equalTo(button1).offset(15)
            make.left.equalTo(button1).offset(15)
        }
        button2.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: 50, height: 50))
            make.top.equalTo(colorView).offset(15)
            make.centerX.equalTo(colorView)
        }
        button2.addSubview(imageView2)
        imageView2.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: 20, height: 20))
            make.top.equalTo(button2).offset(15)
            make.left.equalTo(button2).offset(15)
        }
        button3.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: 50, height: 50))
            make.top.equalTo(colorView).offset(15)
            make.left.equalTo(colorView).offset(UIScreen.main.bounds.width - 100)
        }
        button3.addSubview(imageView3)
        imageView3.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: 20, height: 20))
            make.top.equalTo(button3).offset(15)
            make.left.equalTo(button3).offset(19)
        }
        colorView.addSubview(label1)
        label1.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(70)
            make.centerX.equalTo(75)
        }
        colorView.addSubview(label2)
        label2.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(70)
            make.centerX.equalTo(colorView)
        }
        colorView.addSubview(label3)
        label3.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(70)
            make.centerX.equalTo(UIScreen.main.bounds.width - 75)
        }
    }
}


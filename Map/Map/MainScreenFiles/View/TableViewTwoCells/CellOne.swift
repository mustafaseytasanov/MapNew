//
//  CellOne.swift
//  Map
//
//  Created by Nikita on 28.02.2022.
//

import UIKit
import SnapKit
import Alamofire
import SwiftyJSON
import MapKit

class CellOne: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    private var colorView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let imageView1: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "car")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let label1: UILabel = {
        let label = UILabel()
        label.text = "ЦУМ".localized
        label.textColor = .black
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
        return label
    }()
    
    
    let label2: UILabel = {
        var label = UILabel()
        label.text = "Универмаг в Севастополе".localized
        label.textColor = .gray
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    let orangeButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 25
        button.backgroundColor = .orange
        button.setTitle("4,9", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        return button
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
    
    func configure(with title: Enum) {
                        
    }
    
    // UI
    func setupUI() {
        selectionStyle = .none
        
        contentView.backgroundColor = .lightGray
        contentView.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(
                width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.width*0.75 + 10 + 70))
        }
        contentView.addSubview(colorView)
        colorView.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: UIScreen.main.bounds.width,
                                     height: UIScreen.main.bounds.width * 0.75 + 70))
            make.edges.equalTo(contentView).inset(UIEdgeInsets(
                top: 0, left: 0, bottom: 10, right: 0))
        }
        colorView.addSubview(imageView1)
        imageView1.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: UIScreen.main.bounds.width,
                                     height: UIScreen.main.bounds.width * 0.75))
            make.top.equalTo(colorView).offset(0)
            make.left.equalTo(colorView).offset(0)
        }
        colorView.addSubview(label1)
        label1.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(colorView).offset(UIScreen.main.bounds.width*0.75 + 10)
            make.left.equalTo(colorView).offset(16)
        }
        colorView.addSubview(label2)
        label2.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(colorView).offset(UIScreen.main.bounds.width*0.75 + 37)
            make.left.equalTo(colorView).offset(16)
        }
        colorView.addSubview(orangeButton)
        orangeButton.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: 50, height: 50))
            make.top.equalTo(colorView).offset(UIScreen.main.bounds.width*0.75 + 10)
            make.left.equalTo(colorView).offset(UIScreen.main.bounds.width - 66)
        }
        
    }
}

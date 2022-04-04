//
//  CellFour.swift
//  Map
//
//  Created by Nikita on 01.03.2022.
//

import UIKit
import MapKit

class CellFour: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    let labelText: UILabel = {
        let label = UILabel()
        label.text = "Information".localized
        label.textColor = .black
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 15)
        return label
    }()
    
    let imageView1: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "clock")
        imageView.image = image
        return imageView
    }()
    
    
    let imageView2: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "smartphone")
        imageView.image = image
        return imageView
    }()
    
    let imageView3: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "web")
        imageView.image = image
        return imageView
    }()
    
    let horizontalLine1: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let horizontalLine2: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let buttonAddTime: UIButton = {
        let button = UIButton()
        button.setTitle("Probably open".localized, for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = UIFont(name:"HelveticaNeue", size: 16.0)
        return button
    }()
    
    let buttonAddPhoneNumber: UIButton = {
        let button = UIButton()
        button.setTitle("Add Phone".localized, for: .normal)
        button.titleLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    let buttonAddWebsite: UIButton = {
        let button = UIButton()
        button.setTitle("Add website".localized, for: .normal)
        button.titleLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    let imageView4: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "next")
        imageView.image = image
        return imageView
    }()
    
    let buttonArrow: UIButton = {
        let button = UIButton()
        return button
    }()
    
    let imageView5: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "location")
        imageView.image = image
        return imageView
    }()
    
    
    let mapView: MKMapView = {
        let view = MKMapView()
        return view
    }()
    
    let labelLocation: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    
    private var colorView: UIView = {
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
    
    func configure(with model: [MainData]) {
        labelLocation.text = model[currentTag].address
        let location = CLLocationCoordinate2DMake(model[currentTag].latitude,
                                                  model[currentTag].longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.002,
                                    longitudeDelta: 0.002)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        mapView.addAnnotation(annotation)
    }
    
    // UI
    func setupUI() {
        selectionStyle = .none
        contentView.backgroundColor = .lightGray

        contentView.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(
                width: UIScreen.main.bounds.width, height: 320))
        }
        contentView.addSubview(colorView)
        colorView.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: UIScreen.main.bounds.width,
                                     height: 300))
            make.edges.equalTo(contentView).inset(UIEdgeInsets(
                top: 10, left: 0, bottom: 10, right: 0))
        }
        colorView.addSubview(labelText)
        labelText.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(colorView).offset(5)
            make.left.equalTo(colorView).offset(16)
        }
        colorView.addSubview(imageView1)
        imageView1.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: 18, height: 18))
            make.top.equalTo(colorView).offset(40)
            make.left.equalTo(colorView).offset(16)
        }
        colorView.addSubview(imageView2)
        imageView2.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: 18, height: 18))
            make.top.equalTo(colorView).offset(80)
            make.left.equalTo(colorView).offset(16)
        }
        colorView.addSubview(imageView3)
        imageView3.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: 18, height: 18))
            make.top.equalTo(colorView).offset(120)
            make.left.equalTo(colorView).offset(16)
        }
        colorView.addSubview(buttonAddTime)
        buttonAddTime.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(colorView).offset(40)
            make.left.equalTo(colorView).offset(50)
            make.height.equalTo(18)
        }
        colorView.addSubview(buttonAddPhoneNumber)
        buttonAddPhoneNumber.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(colorView).offset(80)
            make.left.equalTo(colorView).offset(50)
            make.height.equalTo(18)
        }
        colorView.addSubview(buttonAddWebsite)
        buttonAddWebsite.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(colorView).offset(120)
            make.left.equalTo(colorView).offset(50)
            make.height.equalTo(18)
        }
        colorView.addSubview(horizontalLine1)
        horizontalLine1.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(colorView).offset(70)
            make.left.equalTo(colorView).offset(50)
            make.size.equalTo(CGSize(width: UIScreen.main.bounds.width - 50,
                                     height: 1))
        }
        colorView.addSubview(horizontalLine2)
        horizontalLine2.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(colorView).offset(110)
            make.left.equalTo(colorView).offset(50)
            make.size.equalTo(CGSize(width: UIScreen.main.bounds.width - 50,
                                     height: 1))
        }
        colorView.addSubview(mapView)
        mapView.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: UIScreen.main.bounds.width,
                                     height: 100))
            make.top.equalTo(colorView).offset(150)
            make.left.equalTo(colorView).offset(0)
        }
        colorView.addSubview(imageView5)
        imageView5.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: 20,
                                     height: 20))
            make.top.equalTo(colorView).offset(265)
            make.left.equalTo(colorView).offset(16)
        }
        colorView.addSubview(buttonArrow)
        buttonArrow.addSubview(imageView4)
        buttonArrow.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: 20,
                                     height: 20))
            make.top.equalTo(colorView).offset(265)
            make.left.equalTo(colorView).offset(UIScreen.main.bounds.width-36)
        }
        imageView4.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: 20,
                                     height: 20))
            make.top.equalTo(buttonArrow).offset(0)
            make.left.equalTo(buttonArrow).offset(0)
        }
        colorView.addSubview(labelLocation)
        labelLocation.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(16)
            make.top.equalTo(colorView).offset(267)
            make.left.equalTo(colorView).offset(50)
        }
    }

}

//
//  CellOne.swift
//  Map
//
//  Created by Nikita on 28.02.2022.
//

import UIKit
import SnapKit

class CellWithPhotos: UITableViewCell {

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    private let colorView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let photoView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let photoScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.isUserInteractionEnabled = true
        return scrollView
    }()
    
    private let pageControl: UIPageControl = {
        let page = UIPageControl()
        page.currentPage = 0
        page.currentPageIndicatorTintColor = .white
        return page
    }()
    
    
    private let label1: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 21)
        return label
    }()
    
    
    private let label2: UILabel = {
        var label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private let orangeButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 25
        button.backgroundColor = .orange
        button.setTitle("4,9", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        return button
    }()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    @objc func changePage() {
        let x = CGFloat(pageControl.currentPage) * photoScrollView.frame.size.width
        photoScrollView.setContentOffset(CGPoint(x:x, y:0), animated: true)
    }
    
    
    private var photosArray = [UIImageView]()
    
    func configure(with model: [MainDTO], currentTag: Int, arrayOfPhotos: [UIImageView]) {
        
        label1.text = model[currentTag].name
        label2.text = "Place in ".localized + model[currentTag].locality
        pageControl.numberOfPages = arrayOfPhotos.count
        photosArray = arrayOfPhotos
        setupUI()
    }
    
    // UI
    func setupUI() {
        selectionStyle = .none
                
        contentView.backgroundColor = .lightGray
        contentView.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(
                width: UIScreen.main.bounds.width * CGFloat(photosArray.count),
                height: UIScreen.main.bounds.width*0.75 + 10 + 70))
        }
        contentView.addSubview(colorView)
        colorView.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: UIScreen.main.bounds.width * CGFloat(photosArray.count),
                                     height: UIScreen.main.bounds.width*0.75 + 70))
            make.edges.equalTo(contentView).inset(UIEdgeInsets(
                top: 0, left: 0, bottom: 10, right: 0))
        }
        colorView.addSubview(photoScrollView)
        photoScrollView.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: UIScreen.main.bounds.width,
                                     height: UIScreen.main.bounds.width * 0.75))
            make.top.equalTo(colorView).offset(0)
            make.left.equalTo(colorView).offset(0)
        }
        colorView.addSubview(pageControl)
        pageControl.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: UIScreen.main.bounds.width,
                                     height: 50))
            make.top.equalTo(colorView).offset(UIScreen.main.bounds.width*0.75 - 50)
            make.left.equalTo(colorView).offset(0)
        }
        pageControl.addTarget(self, action: #selector(changePage), for: .valueChanged)
        for i in 0..<photosArray.count {
            let imageView = photosArray[i]
            let xPosition = UIScreen.main.bounds.width * CGFloat(i)
            photoScrollView.addSubview(imageView)
            imageView.snp.makeConstraints { (make) -> Void in
                make.size.equalTo(CGSize(width: UIScreen.main.bounds.width,
                                         height: UIScreen.main.bounds.width * 0.75))
                make.top.equalTo(photoScrollView).offset(0)
                make.left.equalTo(photoScrollView).offset(xPosition)
            }
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

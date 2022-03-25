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
    
    private var photoView: UIView = {
        let view = UIView()
        return view
    }()
    
    var photoScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        //scrollView.isScrollEnabled = true
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.isUserInteractionEnabled = true
        return scrollView
    }()
    
    var pageControl: UIPageControl = {
        let page = UIPageControl()
        page.numberOfPages = imageViewDataArray.count
        page.currentPage = 0
        page.currentPageIndicatorTintColor = .white
        return page
    }()
    

    let imageViewArr: [UIImageView] = {
        
        var imageViewArray = [UIImageView]()
                
        for i in 0..<imageViewDataArray.count {
            var imageView = UIImageView()
            imageView.image = UIImage(data: imageViewDataArray[i])
            //imageView.contentMode = .scaleAspectFit
            imageViewArray.append(imageView)
        }

        return imageViewArray
    }()
    
    let label1: UILabel = {
        let label = UILabel()
        label.text = arrayTitles[currentTag]
        label.textColor = .black
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 21)
        return label
    }()
    
    
    let label2: UILabel = {
        var label = UILabel()
        label.text = "Place in ".localized + arrayLocality[currentTag]
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
    
    
    @objc func changePage() {
        let x = CGFloat(pageControl.currentPage) * photoScrollView.frame.size.width
        photoScrollView.setContentOffset(CGPoint(x:x, y:0), animated: true)
    }
    
    // UI
    func setupUI() {
        selectionStyle = .none
                
        contentView.backgroundColor = .lightGray
        contentView.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(
                width: UIScreen.main.bounds.width * CGFloat(imageViewArr.count),
                height: UIScreen.main.bounds.width*0.75 + 10 + 70))
        }
        contentView.addSubview(colorView)
        colorView.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: UIScreen.main.bounds.width * CGFloat(imageViewArr.count),
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
        for i in 0..<imageViewArr.count {
            let imageView = imageViewArr[i]
            let xPosition = UIScreen.main.bounds.width * CGFloat(i)
            photoScrollView.addSubview(imageView)
            imageView.snp.makeConstraints { (make) -> Void in
                make.size.equalTo(CGSize(width: UIScreen.main.bounds.width,
                                         height: UIScreen.main.bounds.width * (photosHeight[i]/photosWidth[i])))
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


extension CellOne: UIScrollViewDelegate {
    
}

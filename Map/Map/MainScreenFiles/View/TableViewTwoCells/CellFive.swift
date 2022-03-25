//
//  CellFive.swift
//  Map
//
//  Created by Nikita on 22.03.2022.
//

import UIKit
import Alamofire

class CellFive: UITableViewCell {

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
    
    let button1: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(.red, for: .normal)
        button.setTitle("Log out".localized, for: .normal)
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        return button
    }()
    
    @objc func handleButton() {
        LoginManager.isLoggedIn = false
        AppDelegate.nav.viewControllers = [LoginViewController(viewModel: LoginViewModel())]
    }
    
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
                width: UIScreen.main.bounds.width, height: 70))
        }
        contentView.addSubview(colorView)
        colorView.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: UIScreen.main.bounds.width,
                                     height: 50))
            make.edges.equalTo(contentView).inset(UIEdgeInsets(
                top: 10, left: 0, bottom: 10, right: 0))

        }
        colorView.addSubview(button1)

        button1.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: UIScreen.main.bounds.width,
                                     height: 50))
            make.top.equalTo(colorView).offset(0)
            make.left.equalTo(colorView).offset(0)
        }
        
       
        
       
        
    }
}

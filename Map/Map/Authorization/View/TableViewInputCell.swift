//
//  CodeTableViewCell.swift
//  Map
//
//  Created by Nikita on 24.01.2022.
//

import UIKit

protocol TableViewInputCellDelegate: AnyObject {
    func textChange(type: CellIndices, text: String)
    func getValidArrayAndSignUpData() -> (array: [Bool], signUpData: [String])
    
}

class TableViewInputCell: UITableViewCell  {
    
    var type: CellIndices?
    weak var delegate: TableViewInputCellDelegate?
    var currentState: Int?
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    private let colorView = UIView()
    
    private let textField: UITextField = {
        let textFieldValue = UITextField()
        textFieldValue.borderStyle = .roundedRect
        textFieldValue.layer.borderWidth = 1
        textFieldValue.layer.borderColor = UIColor.lightGray.cgColor
        return textFieldValue
    }()
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        textField.text = ""
        super.prepareForReuse()
    }
    
    func configure(with title: CellIndices, segmentControlIndex: Int) {
                
        currentState = segmentControlIndex
        type = title
        textField.addTarget(self, action: #selector(textChanged(_:)), for: .allEditingEvents)
        validationResult()
        
        if segmentControlIndex == 0 {

            switch title {
            case .email:
                textField.placeholder = "E-mail".localized
                textField.isSecureTextEntry = false
            case .password:
                textField.placeholder = "Password".localized
                textField.isSecureTextEntry = true
            default:
                break
            }
        } else {
            switch title {
            case .login:
                textField.placeholder = "Login".localized
                textField.isSecureTextEntry = false
            case .email:
                textField.placeholder = "E-mail".localized
                textField.isSecureTextEntry = false
            case .password:
                textField.placeholder = "Password".localized
                textField.isSecureTextEntry = true
            case .repeatPassword:
                textField.placeholder = "Repeat password".localized
                textField.isSecureTextEntry = true
            }
        }
    }
    
    // Result of validation    
    func validationResult() {
        
        if currentState == 1 {
            if let result = delegate?.getValidArrayAndSignUpData().array {
                if let name = type {
                    colorTextField(isValid: result[name.rawValue])
                }
            }
            if let result = delegate?.getValidArrayAndSignUpData().signUpData {
                if let name = type {
                    textField.text = result[name.rawValue]
                }
            }
        }
    }
    
    // Color of textField
    func colorTextField(isValid: Bool) {
        if isValid == true {
            textField.layer.borderColor = UIColor.lightGray.cgColor
            textField.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        } else {
            textField.layer.borderColor = UIColor.red.cgColor
            textField.backgroundColor = UIColor.init(red: 1, green: 0, blue: 0, alpha: 0.1)
        }
    }
    
    // Handler
    @objc func textChanged(_ textField: UITextField) {
        
        let text = textField.text ?? ""
        guard let name = type else {
            return
        }
        delegate?.textChange(type: name, text: text)        
    }
    
    // UI
    func setupUI() {
        selectionStyle = .none
        colorView.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(colorView)
        colorView.addSubview(textField)
        NSLayoutConstraint.activate([
            
            colorView.heightAnchor.constraint(equalToConstant: 40),
            colorView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            colorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            colorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            colorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.topAnchor.constraint(equalTo: colorView.topAnchor, constant: 0),
            textField.bottomAnchor.constraint(equalTo: colorView.bottomAnchor, constant: 0),
            textField.leadingAnchor.constraint(equalTo: colorView.leadingAnchor, constant: 8),
            textField.trailingAnchor.constraint(equalTo: colorView.trailingAnchor, constant: -8),
        ])
    }
}

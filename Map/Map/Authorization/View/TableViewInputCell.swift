//
//  CodeTableViewCell.swift
//  Map
//
//  Created by Nikita on 24.01.2022.
//

import UIKit


protocol TableViewInputCellDelegate: AnyObject {
    func textChange(type: Enum, text: String)
    func getBoolArray() -> (array: [Bool], signUpData: [String])
}

class TableViewInputCell: UITableViewCell  {
    
    var type: Enum?
    weak var delegate: TableViewInputCellDelegate?
                
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    let textField: UITextField = {
        let textFieldValue = UITextField()
        textFieldValue.borderStyle = .roundedRect
        textFieldValue.layer.borderWidth = 1
        textFieldValue.layer.borderColor = UIColor.lightGray.cgColor
        return textFieldValue
    }()
    
    
    private var colorView: UIView = {
        let view = UIView()
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
        textField.text = ""
        super.prepareForReuse()
    }
    
    func configure(with title: Enum) {
                
        type = title
        textField.addTarget(self, action: #selector(textChanged(_:)), for: .allEditingEvents)
        validationResult()
        if flag == 0 {
            switch title {
            case .email:
                textField.placeholder = "E-mail".localized
                textField.isSecureTextEntry = false
            case .password:
                textField.placeholder = "Пароль".localized
                textField.isSecureTextEntry = true
            default:
                break
            }
        } else {
            switch title {
            case .login:
                textField.placeholder = "Логин".localized
                textField.isSecureTextEntry = false
            case .email:
                textField.placeholder = "E-mail".localized
                textField.isSecureTextEntry = false
            case .password:
                textField.placeholder = "Пароль".localized
                textField.isSecureTextEntry = true
            case .repeatPassword:
                textField.placeholder = "Повторите пароль".localized
                textField.isSecureTextEntry = true
            }
        }
    }
    
    // Result of validation
    func validationResult() {
        if flag == 1 {
            if let resultOne = delegate?.getBoolArray().array {
                if let name = type {
                    colorTextField(boolValue: resultOne[name.rawValue])
                }
            }
            if let resultTwo = delegate?.getBoolArray().signUpData {
                if let name = type {
                    textField.text = resultTwo[name.rawValue]
                }
            }
        }
    }
    
    // Color of textField
    func colorTextField(boolValue: Bool) {
        if boolValue == true {
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

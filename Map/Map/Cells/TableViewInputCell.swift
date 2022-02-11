//
//  CodeTableViewCell.swift
//  Map
//
//  Created by Nikita on 24.01.2022.
//

import UIKit

var login = ""
var emailUp = ""
var passwordUp = ""
var repeatPassword = ""

var emailIn = ""
var passwordIn = ""


protocol TableViewInputCellDelegate: AnyObject {
    func arraySignup(index: Int, value: Int)
    func arraySignin(index: Int, value: Int)
    func selectedIndex() -> Int
}

class TableViewInputCell: UITableViewCell, UITextFieldDelegate  {

    
    weak var delegate: TableViewInputCellDelegate?
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.lightGray.cgColor
        return tf
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
        super.prepareForReuse()
    }
    
    let emailHelperObject = EmailHelper()
    let loginHelperObject = LoginHelper()
    let passwordHelperObject = PasswordHelper()
    
    func configure(with title: Enum) {
        
        let flagValue = delegate?.selectedIndex()
        
        if flagValue == 0 {
        
            switch title.rawValue {
            case 1:
                textField.placeholder = "E-mail"
                textField.addTarget(self, action: #selector(funcEmailIn(_:)), for: .editingChanged)
            
            case 2:
                textField.placeholder = "Пароль"
                textField.isSecureTextEntry = true
                textField.addTarget(self, action: #selector(funcPasswordIn(_:)), for: .editingChanged)
            default:
                break
            }

        } else {

            switch title.rawValue {
            case 0:
                textField.placeholder = "Логин"
                textField.isSecureTextEntry = false
                textField.addTarget(self, action: #selector(funcLoginEnd(_:)), for: .editingChanged)
            case 1:
                textField.placeholder = "E-mail"
                UserDefaults.standard.string(forKey: "email")
                textField.isSecureTextEntry = false
                textField.addTarget(self, action: #selector(funcEmailEnd(_:)), for: .editingChanged)
                
            case 2:
                textField.placeholder = "Пароль"
                UserDefaults.standard.string(forKey: "password")
                textField.isSecureTextEntry = true
                textField.addTarget(self, action: #selector(funcPasswordEnd(_:)), for: .editingChanged)
                
            case 3:
                textField.placeholder = "Повторите пароль"
                textField.isSecureTextEntry = true
                textField.addTarget(self, action: #selector(funcRepeatPasswordEnd(_:)), for: .editingChanged)
            default:
                break
            }
        }

    }
        
    func colorOne(textField: UITextField, boolValue: Bool) {
        
        if boolValue == true {
            textField.layer.borderColor = UIColor.lightGray.cgColor
            textField.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        } else {
            textField.layer.borderColor = UIColor.red.cgColor
            textField.backgroundColor = UIColor.init(red: 1, green: 0, blue: 0, alpha: 0.1)
        }
    }
    

    // Handlers
    @objc func funcLoginEnd(_ textField: UITextField) {
        login = textField.text ?? "nil"
        if loginHelperObject.isValidLogin(login) {
            colorOne(textField: textField, boolValue: true)
            delegate?.arraySignup(index: 0, value: 1)
        } else {
            colorOne(textField: textField, boolValue: false)
            delegate?.arraySignup(index: 0, value: 0)
        }
    }
    @objc func funcEmailEnd(_ textField: UITextField) {
        emailUp = textField.text ?? "nil"
        if emailHelperObject.isValidEmail(emailUp) {
            colorOne(textField: textField, boolValue: true)
            delegate?.arraySignup(index: 1, value: 1)
        } else {
            colorOne(textField: textField, boolValue: false)
            delegate?.arraySignup(index: 1, value: 0)
        }
    }
    @objc func funcPasswordEnd(_ textField: UITextField) {
        passwordUp = textField.text ?? "nil"
        if passwordHelperObject.isValidPassword(passwordUp) {
            colorOne(textField: textField, boolValue: true)
            delegate?.arraySignup(index: 2, value: 1)
        } else {
            colorOne(textField: textField, boolValue: false)
            delegate?.arraySignup(index: 2, value: 0)
        }
    }
    @objc func funcRepeatPasswordEnd(_ textField: UITextField) {
        repeatPassword = textField.text ?? "nil"
        if repeatPassword == passwordUp {
            colorOne(textField: textField, boolValue: true)
            delegate?.arraySignup(index: 3, value: 1)
        } else {
            colorOne(textField: textField, boolValue: false)
            delegate?.arraySignup(index: 3, value: 0)
        }
    }
    
    @objc func funcEmailIn(_ textField: UITextField) {
        emailIn = textField.text ?? "nil"
        if (emailIn == UserDefaults.standard.string(forKey: "email")) {
            delegate?.arraySignin(index: 0, value: 1)
        } else {
            delegate?.arraySignin(index: 0, value: 0)
        }
    }
    
    @objc func funcPasswordIn(_ textField: UITextField) {
        passwordIn = textField.text ?? "nil"
        if (passwordIn == UserDefaults.standard.string(forKey: "password")) {
            delegate?.arraySignin(index: 1, value: 1)
        } else {
            delegate?.arraySignin(index: 1, value: 0)
        }
    }
    
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

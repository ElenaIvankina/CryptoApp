//
//  AuthorizationView.swift
//  CryptoApp
//
//  Created by Елена Иванкина on 03.11.2022.
//

import UIKit

protocol AuthorizationViewProtocol: UIView{
    var loginTextField: UITextField {get}
    var passwordTextField: UITextField {get}
    var enterButton: UIButton {get}
}

final class AuthorizationView: UIView, AuthorizationViewProtocol {
    
    private enum DimensionsAuthorizationView {
        static let leadingInset: CGFloat = 8
        static let trailingInset: CGFloat = -8
        static let topInset: CGFloat = 124
        static let bottomInset: CGFloat = -32
        static let betweenInset: CGFloat = 16
        static let heightTextField: CGFloat = 50
        static let widthTextField: CGFloat = 300
        static let largeFontSize: CGFloat = 32
        static let normalFontSize: CGFloat = 20
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Crypto Wallet".uppercased()
        label.textAlignment = .right
        label.textColor = .white
        label.font = .systemFont(ofSize: DimensionsAuthorizationView.largeFontSize)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        return label
    }()
    
    
    let loginTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Логин"
        textField.textAlignment = .left
        textField.textColor = .darkGray
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: DimensionsAuthorizationView.normalFontSize)
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Пароль"
        textField.isSecureTextEntry = true
        textField.textAlignment = .left
        textField.textColor = .darkGray
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: DimensionsAuthorizationView.normalFontSize)
        return textField
    }()
    
    let enterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.tintColor = .white
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .systemFont(ofSize: DimensionsAuthorizationView.largeFontSize)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 12
        return button
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        setupTitleLabel()
        setupLoginTextField()
        setupPasswordTextField()
        setupEnterButton()
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: DimensionsAuthorizationView.topInset),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    
    private func setupLoginTextField() {
        addSubview(loginTextField)
        NSLayoutConstraint.activate([
            loginTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: DimensionsAuthorizationView.topInset),
            loginTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginTextField.heightAnchor.constraint(equalToConstant: DimensionsAuthorizationView.heightTextField),
            loginTextField.widthAnchor.constraint(equalToConstant: DimensionsAuthorizationView.widthTextField)
        ])
    }
    
    private func setupPasswordTextField() {
        addSubview(passwordTextField)
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: DimensionsAuthorizationView.betweenInset),
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: DimensionsAuthorizationView.heightTextField),
            passwordTextField.widthAnchor.constraint(equalToConstant: DimensionsAuthorizationView.widthTextField)
        ])
    }
    
    private func setupEnterButton() {
        addSubview(enterButton)
        NSLayoutConstraint.activate([
            enterButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: DimensionsAuthorizationView.betweenInset),
            enterButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            enterButton.heightAnchor.constraint(equalToConstant: DimensionsAuthorizationView.heightTextField),
            enterButton.widthAnchor.constraint(equalToConstant: DimensionsAuthorizationView.widthTextField)
        ])
    }
    

    
}

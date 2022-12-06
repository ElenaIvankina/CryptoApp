//
//  AuthorizationViewController.swift
//  CryptoApp
//
//  Created by Елена Иванкина on 03.11.2022.
//

import UIKit

final class AuthorizationViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    var authorizationViewModel: AuthorizationViewModelProtocol?
    var authorizationView: AuthorizationViewProtocol?
    
    override func loadView() {
        view = authorizationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        authorizationView?.enterButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    
    @objc func loginButtonTapped () {
        guard let login = authorizationView?.loginTextField.text else {return}
        guard let password = authorizationView?.passwordTextField.text else {return}
        guard let viewModel = authorizationViewModel else {return}
        
        if viewModel.isAuthorized(login: login, password: password) {
            viewModel.setInfo(login: login)
            self.view.window?.rootViewController = UINavigationController(rootViewController: CryptoListVCBuilder.build())
        } else {
            makeAlert(title: "Oops", message: "Login and password must have more than 4 symbols")
        }
        
    }
    
    private func makeAlert (title: String, message: String) {
        
        let alert = UIAlertController(
          title: title,
          message: message,
          preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
            self.authorizationView?.loginTextField.text = ""
            self.authorizationView?.passwordTextField.text = ""
                }))
        
        present(alert, animated: true)
    }

}


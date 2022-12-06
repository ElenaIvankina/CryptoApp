//
//  CryptoListViewController.swift
//  CryptoApp
//
//  Created by Елена Иванкина on 03.11.2022.
//

import UIKit

final class CryptoListViewController: UIViewController {

    var cryptoViewModel: (CryptoViewModelGetDataProtocol & CryptoViewModelConfigureTableViewCellProtocol)?
    
    private var spinner = UIActivityIndicatorView(style: .large)
    private lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CryptoTableViewCell.self, forCellReuseIdentifier: "\(CryptoTableViewCell.reuseIdentifier)")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        setupNavigationBar ()
        setupTableView ()
        setupSpinner ()
        
        cryptoViewModel?.getData()
        setupBindings ()
    }
            
    private func setupNavigationBar () {
        guard let loginUser = UserInfoService.shared.login else {return}
        
        let logoutBarButton: UIBarButtonItem = {
            let barButton = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"),
                                            style: .done, target: self, action: #selector(logoutButtonTapped))
            return barButton
        }()
        let nameBarButton: UIBarButtonItem = {
            let barButton = UIBarButtonItem(title: loginUser, style: .plain, target: self, action: nil)
            barButton.isEnabled = false
            return barButton
        }()
        navigationItem.rightBarButtonItems = [
            logoutBarButton,
            nameBarButton
        ]
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
    }
    
    private func setupTableView () {
        view.addSubview(tableView)
        tableView.frame = view.frame
    }
    
    private func setupSpinner () {
        view.addSubview(spinner)
        spinner.startAnimating()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func setupBindings () {
        cryptoViewModel?.boxIsLoading.bind { [weak self] isLoading in
            self?.spinner.isHidden = !isLoading
        }
        
        cryptoViewModel?.boxCryptoResponses.bind { [weak self] _ in
            self?.tableView.reloadData()
            guard let count = self?.cryptoViewModel?.boxCryptoResponses.value.count else { return }
            if count > 0 {
                self?.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
            }
        }
        
        cryptoViewModel?.boxErrorDescription.bind { [weak self] errorDescription in
            if errorDescription.hasError {
                    self?.makeAlert(title: "Oh no", message: errorDescription.describing)
            }
        }
    }
    
    private func makeAlert (title: String, message: String) {
        
        let alert = UIAlertController(
          title: title,
          message: message,
          preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Try again", style: UIAlertAction.Style.default, handler: { [weak self] _ in
            self?.cryptoViewModel?.getData()
                }))
        
        present(alert, animated: true)
    }
    
    @objc func logoutButtonTapped() {
        UserInfoService.shared.clearInfoUserDefaults()
        UserInfoService.shared.clearLogin()
        self.view.window?.rootViewController = AuthorizationVCBuilder.build()
    }
    
    @objc func descendingSortButtonTapped() {
        cryptoViewModel?.sort(descending: true)
    }
    
    @objc func ascendingSortButtonTapped() {
        cryptoViewModel?.sort(descending: false)
    }
    
}

extension CryptoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 92
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let crypto = cryptoViewModel?.boxCryptoResponses.value[indexPath.row] else { return }
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(CryptoDetailVCBuilder.build(cryptoModel: crypto), animated: true)
    }
    
}

extension CryptoListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoViewModel?.boxCryptoResponses.value.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(CryptoTableViewCell.reuseIdentifier)", for: indexPath) as? CryptoTableViewCell else {return UITableViewCell()}
        guard let crypto = cryptoViewModel?.boxCryptoResponses.value[indexPath.row] else { return cell }
        cryptoViewModel?.configureCryptoTableViewCell(cell: cell, cryptoModel: crypto)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 52
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cryptoTableHeaderView = CryptoTableHeaderView()
        cryptoTableHeaderView.descendingSortButton.addTarget(self, action: #selector(descendingSortButtonTapped), for: .touchUpInside)
        cryptoTableHeaderView.ascendingSortButton.addTarget(self, action: #selector(ascendingSortButtonTapped), for: .touchUpInside)
        return cryptoTableHeaderView
    }
    
    
}

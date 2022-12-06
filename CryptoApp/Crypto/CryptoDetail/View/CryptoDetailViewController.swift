//
//  CryptoDetailViewController.swift
//  CryptoApp
//
//  Created by Елена Иванкина on 03.11.2022.
//

import UIKit

final class CryptoDetailViewController: UIViewController {
        
    var cryptoDetailView: CryptoDetailViewProtocol?
    var cryptoDetailViewModel: CryptoDetailViewModelConfigureViewProtocol?
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureScrollView()
    }
    
    private func configureScrollView() {
        guard let scrollContentView = cryptoDetailView else {return}
        
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        scrollContentView.frame = .init(x: 0, y: 0, width: scrollView.bounds.width, height: scrollContentView.heightOfContent)
        scrollView.addSubview(scrollContentView)
        scrollView.contentSize = .init(width: scrollView.bounds.width, height: scrollContentView.heightOfContent)

    }

    
}



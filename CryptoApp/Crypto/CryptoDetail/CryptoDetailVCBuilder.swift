//
//  CryptoDetailVCBuilder.swift
//  CryptoApp
//
//  Created by Елена Иванкина on 15.11.2022.
//

import UIKit

final class CryptoDetailVCBuilder {
    
    static func build(cryptoModel: CryptoResponse) -> UIViewController {
        let vc = CryptoDetailViewController()
        let view = CryptoDetailView()
        let vm = CryptoDetailViewModel()
        vm.configureCryptoDetailView(view: view, cryptoModel: cryptoModel)
        vc.cryptoDetailView = view
        vc.cryptoDetailViewModel = vm
        return vc
    }
    
}

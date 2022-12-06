//
//  CryptoListVCBuilder.swift
//  CryptoApp
//
//  Created by Елена Иванкина on 15.11.2022.
//

import UIKit

final class CryptoListVCBuilder {
    
    static func build() -> UIViewController {
        let vc = CryptoListViewController()
        let vm = CryptoViewModel()
        vc.cryptoViewModel = vm
        return vc
    }
    
}


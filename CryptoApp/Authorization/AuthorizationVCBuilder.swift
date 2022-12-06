//
//  AuthorizationVCBuilder.swift
//  CryptoApp
//
//  Created by Елена Иванкина on 15.11.2022.
//

import UIKit

final class AuthorizationVCBuilder {
    
    static func build() -> UIViewController {
        let vc = AuthorizationViewController()
        let vm = AuthorizationViewModel()
        let view = AuthorizationView()
        vc.authorizationViewModel = vm
        vc.authorizationView = view
        return vc
    }
    
}

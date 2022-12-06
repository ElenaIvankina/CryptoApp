//
//  AuthorizationViewModel.swift
//  CryptoApp
//
//  Created by Елена Иванкина on 03.11.2022.
//

import Foundation

protocol AuthorizationViewModelProtocol {
    func isAuthorized (login: String, password: String) -> Bool
    func setInfo (login: String) -> Void
}

final class AuthorizationViewModel: AuthorizationViewModelProtocol {
    
    func isAuthorized (login: String, password: String) -> Bool {
        return login.count > 4 && password.count > 4
    }
    
    func setInfo (login: String) {
        UserInfoService.shared.setInfoUserDefaults(login: login)
        UserInfoService.shared.setLogin(login: login)
    }
}

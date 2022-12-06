//
//  UserInfoService.swift
//  CryptoApp
//
//  Created by Елена Иванкина on 29.11.2022.
//

import Foundation

class UserInfoService {
    
    private enum UserDefaultsKeys: String {
        case login
    }

    private(set) var login: String?
    
    static let shared = UserInfoService()
    
    private init () {}
    
    func getInfoUserDefaults () -> String? {
        UserDefaults.standard.string(forKey: UserDefaultsKeys.login.rawValue)
    }
    
    func setInfoUserDefaults (login: String) -> Void {
        UserDefaults.standard.set(login, forKey: UserDefaultsKeys.login.rawValue)
    }
    
    func setLogin (login: String) -> Void {
        self.login = login
    }
    
    func clearInfoUserDefaults () -> Void {
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.login.rawValue)
    }
    
    func clearLogin () -> Void {
        self.login = nil
    }
}

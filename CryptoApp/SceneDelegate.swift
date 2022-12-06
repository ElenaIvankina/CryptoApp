//
//  SceneDelegate.swift
//  CryptoApp
//
//  Created by Елена Иванкина on 03.11.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        if let login = UserInfoService.shared.getInfoUserDefaults() {
            UserInfoService.shared.setLogin(login: login)
            window?.rootViewController = UINavigationController(rootViewController: CryptoListVCBuilder.build())
        } else {
            window?.rootViewController = AuthorizationVCBuilder.build()
        }
        window?.makeKeyAndVisible()
    }

}


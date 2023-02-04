//
//  SceneDelegate.swift
//  TipCalculator
//
//  Created by Amjad Khan on 04/02/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let tipCalculatorViewController = TipCalculatorViewController()
        window?.rootViewController = tipCalculatorViewController
        window?.makeKeyAndVisible()
    }
}


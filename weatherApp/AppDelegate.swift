//
//  AppDelegate.swift
//  weatherApp
//
//  Created by Марк Пушкарь on 01.02.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
        let navigationVC = UINavigationController()
        let appCoordinator = AppCoordinator()
        appCoordinator.navigationController = navigationVC
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = navigationVC
        appCoordinator.start()

        return true
    }

}

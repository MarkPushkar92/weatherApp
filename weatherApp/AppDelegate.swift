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
    private let appCoordinator = AppCoordinator(viewModelFactory: ViewModelFactoryImpl())
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
        let navigationVC = UINavigationController()
        
        appCoordinator.navigationController = navigationVC
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = navigationVC
        appCoordinator.start()

        return true
    }

}

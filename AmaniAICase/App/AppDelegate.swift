//
//  AppDelegate.swift
//  AmaniAICase
//
//  Created by Y. Yılmaz Erdoğmuş on 1.03.2024.
//

import UIKit
import CoreData

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        configureWindow(destinationVC: ViewController())
        
        return true
    }
    
    func configureWindow(destinationVC: UIViewController) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.overrideUserInterfaceStyle = .light
        window?.makeKeyAndVisible()
        window?.rootViewController = destinationVC
    }
}

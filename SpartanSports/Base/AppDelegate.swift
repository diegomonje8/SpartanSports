//
//  AppDelegate.swift
//  SpartanSports
//
//  Created by MAC on 27/5/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var  window: UIWindow?
    let appAssembly: AppAssemblyProtocol = AppAssembly()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            appAssembly.setPrincipalViewController(in: window)
        }
        
        return true
    }




}


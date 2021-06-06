//
//  AppAssembly.swift
//  SpartanSports
//
//  Created by MAC on 28/5/21.
//

import Foundation
import UIKit

protocol AppAssemblyProtocol {
    func setPrincipalViewController(in window: UIWindow)
}

class AppAssembly : AppAssemblyProtocol {
    
    var actualViewController : UIViewController!
    
    func setPrincipalViewController(in window: UIWindow) {
        actualViewController = SplashAssembly.splashViewController()
        window.rootViewController = actualViewController
        window.makeKeyAndVisible()
    }
    
    internal func createSlindingMenu(window: UIWindow, vc: UIViewController, menu: [MenuResponse]) {
        self.customUI()
        let frontViewController = vc
        let rearViewController = MenuAssembly.viewController(menu: dataDTO.init(menu: menu))
        let swrevealVC = SWRevealViewController(rearViewController: rearViewController, frontViewController: frontViewController)
        swrevealVC?.toggleAnimationType = SWRevealToggleAnimationType.easeOut
        swrevealVC?.toggleAnimationDuration = 0.3
        window.rootViewController = swrevealVC
        window.makeKeyAndVisible()
    }
    
    fileprivate func customUI() {
        let navBar = UINavigationBar.appearance()
        let tabBar = UITabBar.appearance()
        //let toolBar = UIToolbar.appearance()
        
        navBar.barTintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        tabBar.barTintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        tabBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navBar.barStyle = .black
        
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)]
        
    }
    
}



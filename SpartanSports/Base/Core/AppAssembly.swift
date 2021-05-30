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
    
}



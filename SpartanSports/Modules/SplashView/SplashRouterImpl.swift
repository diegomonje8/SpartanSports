//
//  SplashRouterImpl.swift
//  SpartanSports
//
//  Created by MAC on 30/5/21.
//

import Foundation

protocol SplashRouterProtocol {
    func showHomeTabBar(dataMenu: [MenuResponse])
}

class SplashRouterImpl: BaseRouter<SplashPresenterProtocol> {
    
}

extension SplashRouterImpl : SplashRouterProtocol {
    internal func showHomeTabBar(dataMenu: [MenuResponse]) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let assembly = AppAssembly()
        let vc = HomeTabBarAssembly.homeTabBarController()
        assembly.createSlindingMenu(window: delegate.window!, vc: vc, menu: dataMenu)
    }
    
    
}

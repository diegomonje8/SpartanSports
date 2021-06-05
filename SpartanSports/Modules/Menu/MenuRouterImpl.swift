// MenuRouterImpl.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol MenuRouterProtocol {
    func showWebSiteInRouter()
    func showDefaultAlert(delegate: AlertDefaultViewControllerDelegate, model: DefaultAlertViewModel)
    
}

class MenuRouterImpl: BaseRouter< MenuPresenterProtocol> {
    
    
}

extension MenuRouterImpl: MenuRouterProtocol {
    func showWebSiteInRouter() {
        
    }
    
    func showDefaultAlert(delegate: AlertDefaultViewControllerDelegate, model: DefaultAlertViewModel) {
        let vc = AlertDefaultViewController()
        vc.delagate = delegate
        vc.viewModel = model
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        viewController?.present(vc, animated: true, completion: nil)
    }
    
    
    
    
    
}

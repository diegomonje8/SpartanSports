// MenuRouterImpl.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol MenuRouterProtocol {
    func showWebSiteInRouter()
    func showDefaultAlert(delegate: AlertDefaultViewControllerDelegate, model: DefaultAlertViewModel)
    func navigateToConsejosRouter(dataConsejos: [ConsejosGenerale])
}

class MenuRouterImpl: BaseRouter< MenuPresenterProtocol> {
    
    
}

extension MenuRouterImpl: MenuRouterProtocol {
   
    
    func showWebSiteInRouter() {
        let vc = WebViewAssembly.viewController()
        //vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func showDefaultAlert(delegate: AlertDefaultViewControllerDelegate, model: DefaultAlertViewModel) {
        let vc = AlertDefaultViewController()
        vc.delegate = delegate
        vc.viewModel = model
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        viewController?.present(vc, animated: true, completion: nil)
    }
    
    func navigateToConsejosRouter(dataConsejos: [ConsejosGenerale]) {
        let vc = ConsejosAssembly.viewController(consejos: DataConsejosDTO.init(consejos: dataConsejos))
        self.present(vc, animated: true, completion: nil)
    }
    
    
}

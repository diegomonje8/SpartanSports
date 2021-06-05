// WebViewAssembly.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

final public class WebViewAssembly {
    
    static func navigationController() -> BaseNavigationController {
        let navigationController = BaseNavigationController(rootViewController: viewController())
        return navigationController
    }
    
    static func viewController() -> WebViewViewController {
        let vc = WebViewViewController(nibName: WebViewViewController.defaultResuseIdentifierViewController, bundle: nil)
        vc.presenter = presenter(viewController: vc)
        return vc
    }
    
    static func presenter(viewController: WebViewViewController) -> WebViewPresenterProtocol {
        let presenter = WebViewPresenterImpl(viewController: viewController)
        presenter.router = router(viewController: viewController, presenter: presenter)
        presenter.interactor = interactor()
        return presenter
    }
    
    static func interactor() -> WebViewInteractorProtocol {
        let interactor = WebViewInteractorImpl()
        return interactor
    }
    
    static func router(viewController: WebViewViewController, presenter: WebViewPresenterProtocol) -> WebViewRouterProtocol {
        let router = WebViewRouterImpl(presenter: presenter, view: viewController)
        return router
    }
    
}


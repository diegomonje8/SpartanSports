//
//  SplashAssembly.swift
//  SpartanSports
//
//  Created by MAC on 30/5/21.
//

import Foundation

final public class SplashAssembly {
    
        static func splashNavigationController() -> BaseNavigationController {
    
            let navigationConroller = BaseNavigationController(rootViewController: splashViewController())
            return navigationConroller
    
        }
    
    static func splashViewController() -> SplashViewController {
        let vc = SplashViewController(nibName: SplashViewController.defaultResuseIdentifierViewController, bundle: nil)
        vc.presenter = presenter(viewController: vc)
        return vc
    }
    
    static func presenter(viewController: SplashViewController) -> SplashPresenterProtocol {
        let presenter = SplashPresenterImpl(viewController: viewController)
        presenter.interactor = interactor(presenter: presenter)
        presenter.router = router(viewController: viewController, presenter: presenter)
        return presenter
    }
    
    static func interactor(presenter: SplashPresenterProtocol) -> SplashInteractorProtocol {
        let interactor = SplashInteractorImpl(presenter: presenter)
        return interactor
    }
    
    static func router(viewController: SplashViewController  ,presenter: SplashPresenterProtocol) -> SplashRouterProtocol {
        let router = SplashRouterImpl(presenter: presenter, view: viewController)
        return router
    }
    
}

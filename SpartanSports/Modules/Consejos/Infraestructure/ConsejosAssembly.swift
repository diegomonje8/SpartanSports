// ConsejosAssembly.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

final public class ConsejosAssembly {
    
    static func navigationController() -> BaseNavigationController {
        let navigationController = BaseNavigationController(rootViewController: viewController())
        return navigationController
    }
    
    static func viewController() -> ConsejosViewController {
        let vc = ConsejosViewController(nibName: ConsejosViewController.defaultResuseIdentifierViewController, bundle: nil)
        vc.presenter = presenter(viewController: vc)
        return vc
    }
    
    static func presenter(viewController: ConsejosViewController) -> ConsejosPresenterProtocol {
        let presenter = ConsejosPresenterImpl(viewController: viewController)
        presenter.router = router(viewController: viewController, presenter: presenter)
        presenter.interactor = interactor()
        return presenter
    }
    
    static func interactor() -> ConsejosInteractorProtocol {
        let interactor = ConsejosInteractorImpl()
        return interactor
    }
    
    static func router(viewController: ConsejosViewController, presenter: ConsejosPresenterProtocol) -> ConsejosRouterProtocol {
        let router = ConsejosRouterImpl(presenter: presenter, view: viewController)
        return router
    }
    
}


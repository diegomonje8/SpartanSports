// ConsejosAssembly.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

final public class ConsejosAssembly {
    
    static func navigationController(consejos: DataConsejosDTO? = nil) -> BaseNavigationController {
        let navigationController = BaseNavigationController(rootViewController: viewController(consejos: consejos))
        return navigationController
    }
    
    static func viewController(consejos: DataConsejosDTO? = nil) -> ConsejosViewController {
        let vc = ConsejosViewController(nibName: ConsejosViewController.defaultResuseIdentifierViewController, bundle: nil)
        vc.presenter = presenter(viewController: vc, data: consejos)
        return vc
    }
    
    static func presenter(viewController: ConsejosViewController, data: DataConsejosDTO? = nil) -> ConsejosPresenterProtocol {
        let presenter = ConsejosPresenterImpl(viewController: viewController)
        presenter.router = router(viewController: viewController, presenter: presenter)
        presenter.dataConsejos = data?.consejos ?? []
        return presenter
    }
    
    static func router(viewController: ConsejosViewController, presenter: ConsejosPresenterProtocol) -> ConsejosRouterProtocol {
        let router = ConsejosRouterImpl(presenter: presenter, view: viewController)
        return router
    }
    
}

struct DataConsejosDTO {
    var consejos: [ConsejosGenerale]
}

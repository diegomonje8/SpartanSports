//
//  DetalleConsejosAssembly.swift
//  SpartanSports
//
//  Created by MAC on 6/6/21.
//

import Foundation


final class DetalleConsejosAssembly {
    
    static func viewController(consejos: DetailConsejosDTO? = nil) -> DetalleConsejosViewController {
        let vc = DetalleConsejosViewController(nibName: DetalleConsejosViewController.defaultResuseIdentifierViewController, bundle: nil)
        vc.presenter = presenter(viewController: vc, data: consejos)
        return vc
    }
    
    static func presenter(viewController: DetalleConsejosViewController, data: DetailConsejosDTO? = nil) -> DetalleConsejosPresenterProtocol {
        let presenter = DetalleConsejosPresenterImpl()
        presenter.dataDetailConsejos = data?.consejos ?? []
        return presenter
    }
    
}

struct DetailConsejosDTO {
    var consejos: [MessageArray]?
}

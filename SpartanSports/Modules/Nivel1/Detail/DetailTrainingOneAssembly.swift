//
//  DetailTrainingOneAssembly.swift
//  SpartanSports
//
//  Created by MAC on 6/6/21.
//

import Foundation

final class DetailTrainingOneAssembly {
    
    static func viewController(data: DetailTrainingOneDTO? = nil) -> DetailTrainingOneViewController {
        let vc = DetailTrainingOneViewController(nibName: DetailTrainingOneViewController.defaultResuseIdentifierViewController, bundle: nil)
        vc.presenter = presenter(viewConreoller: vc, data: data)
        return vc
    }
    
    static func presenter(viewConreoller: DetailTrainingOneViewController, data: DetailTrainingOneDTO? = nil) -> DetailTrainingOnePresenterProtocol {
        let presenter = DetailTrainingOnePresenterImpl()
        presenter.viewModel = data?.trainings
        return presenter
        
    }
    
}

struct DetailTrainingOneDTO {
    var trainings: ArrayDiccionariosNivel
}

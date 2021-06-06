// TrainingOneRouterImpl.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol TrainingOneRouterProtocol {
    func showDetail(model: ArrayDiccionariosNivel)
}

class TrainingOneRouterImpl: BaseRouter< TrainingOnePresenterProtocol> {
    
    
}

extension TrainingOneRouterImpl: TrainingOneRouterProtocol {
    func showDetail(model: ArrayDiccionariosNivel) {
        let vc = DetailTrainingOneAssembly.viewController(data: DetailTrainingOneDTO.init(trainings: model))
        self.show(vc)
    }
    
    
    
}

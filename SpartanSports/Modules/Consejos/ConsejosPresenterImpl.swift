// ConsejosPresenter.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol ConsejosPresenterProtocol {
   
}

class ConsejosPresenterImpl: BasePresenter<ConsejosViewControllerProtocol, ConsejosRouterProtocol> {
    
    var interactor: ConsejosInteractorProtocol?
    
}


extension ConsejosPresenterImpl: ConsejosPresenterProtocol {
    
  
}

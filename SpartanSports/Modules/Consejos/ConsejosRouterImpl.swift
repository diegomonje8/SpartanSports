// ConsejosRouterImpl.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol ConsejosRouterProtocol {
    func showDetail(model : [MessageArray]?)
}

class ConsejosRouterImpl: BaseRouter< ConsejosPresenterProtocol> {
    
    
}

extension ConsejosRouterImpl: ConsejosRouterProtocol {
    func showDetail(model: [MessageArray]?) {
        //
    }
   
    
    
}

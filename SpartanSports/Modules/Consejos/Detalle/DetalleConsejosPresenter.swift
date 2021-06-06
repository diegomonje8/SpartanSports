//
//  DetalleConsejosPresenter.swift
//  SpartanSports
//
//  Created by MAC on 6/6/21.
//

import Foundation

protocol DetalleConsejosPresenterProtocol {
    func numberOfRowsInSection() -> Int
    func informationForItem(indexPath: Int) -> MessageArray
}

class DetalleConsejosPresenterImpl {
    
    var dataDetailConsejos : [MessageArray] = []
    
}


extension DetalleConsejosPresenterImpl: DetalleConsejosPresenterProtocol {
    func numberOfRowsInSection() -> Int {
        self.dataDetailConsejos.count
    }
    
    func informationForItem(indexPath: Int) -> MessageArray {
        self.dataDetailConsejos[indexPath]
    }
    
    
}


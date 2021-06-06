// ConsejosPresenter.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol ConsejosPresenterProtocol {
   func getData()
}

class ConsejosPresenterImpl: BasePresenter<ConsejosViewControllerProtocol, ConsejosRouterProtocol> {
    
    var dataConsejos : [ConsejosGenerale] = []
    weak var delegate : TablePresenterDelegate?
    
    internal func updateData() {
        self.delegate?.dataSourceUpdated()
    }
    
}


extension ConsejosPresenterImpl: ConsejosPresenterProtocol {
    func getData() {
        updateData()
    }
    
}

extension ConsejosPresenterImpl : TablePresenterProtocol {
    
    func numberOfCell(_ tableType: TableType, section: Int) -> Int {
        return dataConsejos.count
    }
    
    func object(_ tableType: TableType, indexPath: IndexPath) -> Any {
        self.dataConsejos[indexPath.row]
    }
    
    func heightForRowAt(_ tableType: TableType, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func didTapRow(_ tableType: TableType, indexPath: IndexPath) {
        self.router?.showDetail(model: self.dataConsejos[indexPath.row].messageArray)
    }
}

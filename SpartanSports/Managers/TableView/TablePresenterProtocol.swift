//
//  TablePresenterProtocol.swift
//  SpartanSports
//
//  Created by MAC on 6/6/21.
//

import Foundation

protocol TablePresenterProtocol : AnyObject {
    var delegate: TablePresenterDelegate? { get set }
    
    func numberOfCell(_ tableType: TableType, section: Int) -> Int
    func object(_ tableType: TableType, indexPath: IndexPath) -> Any
    func didTapRow(_ tableType: TableType, indexPath: IndexPath)
    func heightForRowAt(_ tableType: TableType, heightForRowAt indexPath: IndexPath) -> CGFloat
}

extension TablePresenterProtocol {
    func didTapRow(_ tableType: TableType, indexPath: IndexPath) {}
    func heightForRowAt(_ tableType: TableType, heightForRowAt indexPath: IndexPath) -> CGFloat { return 44 }
}

protocol TablePresenterDelegate : AnyObject {
    func dataSourceUpdated()
}

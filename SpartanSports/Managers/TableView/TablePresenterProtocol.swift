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
    func estimatedHeightForRowAt(_ tableType: TableType, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    func willDisplay(_ tableType: TableType, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    func cell(_ tableType: TableType, cell: Any)
}


extension TablePresenterProtocol {
    func didTapRow(_ tableType: TableType, indexPath: IndexPath) {}
    func heightForRowAt(_ tableType: TableType, heightForRowAt indexPath: IndexPath) -> CGFloat { return 44 }
    func estimatedHeightForRowAt(_ tableType: TableType, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat { return UITableView.automaticDimension}
    func willDisplay(_ tableType: TableType, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) { cell.layoutIfNeeded() }
    func cell(_ tableType: TableType, cell: Any)  {}
}

protocol TablePresenterDelegate : AnyObject {
    func dataSourceUpdated()
}

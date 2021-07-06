//
//  TableViewManager.swift
//  SpartanSports
//
//  Created by MAC on 6/6/21.
//

import Foundation
import UIKit

enum TableType {
    case unspecified
}

class TableViewManager: NSObject {
   
    weak var tableView: UITableView?
    weak var presenter: TablePresenterProtocol?
    var tableType = TableType.unspecified
    
    init(tableType : TableType = .unspecified, tableView: UITableView?, presenter: Any?) {
        super .init()
        self.tableType = tableType
        self.tableView = tableView
        self.presenter = presenter as? TablePresenterProtocol
        self.presenter?.delegate = self
        
        setup()
    }
    
    private func setup() {
        tableView?.delegate = self
        tableView?.dataSource = self
        
        tableView?.clipsToBounds = true
        tableView?.separatorStyle = .none
        tableView?.separatorColor = UIColor.clear
        tableView?.separatorInset = .zero
        tableView?.showsVerticalScrollIndicator = false
        tableView?.keyboardDismissMode = .interactive
        tableView?.tableFooterView = UIView(frame: .zero)
        tableView?.estimatedRowHeight = 44
        tableView?.sectionHeaderHeight = UITableView.automaticDimension
        tableView?.rowHeight = UITableView.automaticDimension
        
        
        
    }
}

extension TableViewManager : UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.presenter?.numberOfCell(tableType, section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = FactoryCell.cell(for: self.presenter?.object(tableType, indexPath: indexPath),
                                    tableView: tableView,
                                    presenter: self.presenter
                                )
        self.presenter?.cell(tableType, cell: cell)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didTapRow(tableType, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return presenter?.heightForRowAt(tableType, heightForRowAt: indexPath) ?? 0
    }
    
}

extension TableViewManager : TablePresenterDelegate {
    func dataSourceUpdated() {
        self.tableView?.reloadData()
    }
}

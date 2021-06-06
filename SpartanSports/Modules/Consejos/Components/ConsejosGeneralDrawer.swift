//
//  ConsejosGeneralDrawer.swift
//  SpartanSports
//
//  Created by MAC on 6/6/21.
//

import Foundation


class ConsejosGeneralesDrawer {
    
    static func cell(model: ConsejosGenerale, tableView: UITableView, presenter: Any?) -> UITableViewCell {
        
        guard let cell = BaseTableViewCell<Any>.createBaseCell(tableView: tableView, cell: ConsejosCell.self, cellName: ConsejosCell.defaultResuseIdentifier, model: model) else { return UITableViewCell()}
        
        return cell
        
    }
    
}

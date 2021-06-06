//
//  DetailTrainingTitleCellDrawer.swift
//  SpartanSports
//
//  Created by MAC on 6/6/21.
//

import Foundation

class DetailTrainingTitleCellDrawer {
    
    static func cell(model: TrainingModelHeader, tableView: UITableView, presenter: Any?) -> UITableViewCell {
        
        guard let cell = BaseTableViewCell<Any>.createBaseCell(tableView: tableView, cell: DetailTrainingTitleCell.self, cellName: DetailTrainingTitleCell.defaultResuseIdentifier, model: model) else { return UITableViewCell()}
        return cell
        
    }
    
}


class DetailTrainingInfoCellDrawer {
    
    static func cell(model: TrainingModelInfo, tableView: UITableView, presenter: Any?) -> UITableViewCell {
        
        guard let cell = BaseTableViewCell<Any>.createBaseCell(tableView: tableView, cell: TrainingOneInfoCell.self, cellName: TrainingOneInfoCell.defaultResuseIdentifier, model: model) else { return UITableViewCell()}
        return cell
        
    }
    
}

class DetailTrainingVideoCellDrawer {
    
    static func cell(model: TrainingModelVideo, tableView: UITableView, presenter: Any?) -> UITableViewCell {
        
        guard let cell = BaseTableViewCell<Any>.createBaseCell(tableView: tableView, cell: DetailTrainingVideoCell.self, cellName: DetailTrainingVideoCell.defaultResuseIdentifier, model: model) else { return UITableViewCell()}
        return cell
        
    }
    
}

//
//  FactoryCell.swift
//  SpartanSports
//
//  Created by MAC on 6/6/21.
//

import Foundation
import UIKit

class FactoryCell: NSObject {
    
    class func view(for object: Any?, tableView: UITableView, presenter: Any? = nil) -> UIView {
        return cell(for: object, tableView: tableView, presenter: presenter).contentView
    }
    
    class func cell(for object: Any?, tableView: UITableView, presenter: Any? = nil) -> UITableViewCell {
        switch object {
        case let model as ConsejosGenerale:
            return ConsejosGeneralesDrawer.cell(model: model, tableView: tableView, presenter: presenter)
        case let model as TrainingModelHeader:
            return DetailTrainingTitleCellDrawer.cell(model: model, tableView: tableView, presenter: presenter)
        case let model as TrainingModelInfo:
            return DetailTrainingInfoCellDrawer.cell(model: model, tableView: tableView, presenter: presenter)
        case let model as TrainingModelVideo:
            return DetailTrainingVideoCellDrawer.cell(model: model, tableView: tableView, presenter: presenter)
        default:
            return UITableViewCell()
        }
        
    }
}

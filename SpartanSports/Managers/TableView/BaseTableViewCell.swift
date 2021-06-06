//
//  BaseTableViewCell.swift
//  SpartanSports
//
//  Created by MAC on 6/6/21.
//

import Foundation

class BaseTableViewCell<CellModel: Any>: UITableViewCell {
    
    var cellModel: CellModel?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        self.clear()
    }
    
    func clear() {}
    
    func configure(cellModel: CellModel) {
        self.cellModel = cellModel
    }
    
}

extension BaseTableViewCell {
    
    static func createBaseCell<CellModel: Any, CellClass: BaseTableViewCell<CellModel>>(tableView: UITableView, cell: CellClass.Type, cellName: String, model: CellModel) -> CellClass? {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellName) as? CellClass
        if cell == nil {
            tableView.register(UINib(nibName: cellName, bundle: .main), forCellReuseIdentifier: cellName)
            cell = tableView.dequeueReusableCell(withIdentifier: cellName) as? CellClass
        }
        cell?.configure(cellModel: model)
        return cell
    }
    
}

//
//  TrainingOneInfoCell.swift
//  SpartanSports
//
//  Created by MAC on 7/6/21.
//

import UIKit

class TrainingOneInfoCell: BaseTableViewCell<TrainingModelInfo>, ReuseIdentifierInterface {

    @IBOutlet weak var infoLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func configure(cellModel: TrainingModelInfo) {
        self.infoLbl.text = cellModel.descripcionEjercicio
    }
    
}

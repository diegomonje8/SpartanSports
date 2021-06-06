//
//  ConsejosCell.swift
//  SpartanSports
//
//  Created by MAC on 6/6/21.
//

import UIKit

class ConsejosCell: BaseTableViewCell<ConsejosGenerale>, ReuseIdentifierInterface {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myTitleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func configure(cellModel: ConsejosGenerale) {
        self.myTitleLbl.text = "\(cellModel.title ?? "") \(cellModel.subtitle ?? "")"
        self.myImageView.image = showIMageConsejosWithName(imageConsejo: cellModel)
    }
}

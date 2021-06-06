//
//  DetalleConsejosCell.swift
//  SpartanSports
//
//  Created by MAC on 6/6/21.
//

import UIKit

class DetalleConsejosCell: UITableViewCell {

    @IBOutlet weak var myTitleLbl: UILabel!
    @IBOutlet weak var myMessageLbl: UILabel!
    
    static let identifier = String(describing: DetalleConsejosCell.self)
    static var nib: UINib {
        UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    internal func configCell(data: MessageArray) {
        self.myTitleLbl.text = data.titleMessage
        self.myMessageLbl.text = data.developMessage
    }
    
}

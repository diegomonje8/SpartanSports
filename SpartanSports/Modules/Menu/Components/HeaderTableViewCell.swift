//
//  HeaderTableViewCell.swift
//  SpartanSports
//
//  Created by MAC on 30/5/21.
//

import UIKit

protocol HeaderTableViewCellProtocol {
    func configCell(data: Menu)
}

class HeaderTableViewCell: UITableViewCell, ReuseIdentifierInterface, HeaderTableViewCellProtocol {

    //MARK: INOutlets
    @IBOutlet weak var lblLiteral: UILabel!
    @IBOutlet weak var imageAvatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageAvatar.layer.cornerRadius = self.imageAvatar.frame.width / 2
        imageAvatar.layer.borderColor = UIColor(red: 252/255, green: 164/255, blue: 56/255, alpha: 1).cgColor
        imageAvatar.layer.borderWidth = 1.5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    internal func configCell(data: Menu) {
        self.lblLiteral.text = data.literal
    }
    
}

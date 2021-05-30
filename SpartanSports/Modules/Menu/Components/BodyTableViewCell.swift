//
//  BodyTableViewCell.swift
//  SpartanSports
//
//  Created by MAC on 30/5/21.
//

import UIKit

protocol BodyTableViewCellDelegate: AnyObject {
    func sendToVC(data: Menu?)
}

protocol BodyTableViewCellProtocol {
    func configCell(data: Menu)
}

class BodyTableViewCell: UITableViewCell, ReuseIdentifierInterface {
    
    //MARK: IBOutlets
    @IBOutlet weak var imageAvatarCell: UIImageView!
    @IBOutlet weak var lblAvatarName: UILabel!
    
    weak var delegate : BodyTableViewCellDelegate!
    var data : Menu?
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func actionMenu(_ sender: Any) {
        delegate.sendToVC(data: data)
    }
    
    
    
}

extension BodyTableViewCell : BodyTableViewCellProtocol {
    
    func configCell(data: Menu) {
        self.data = data
        lblAvatarName.text = data.literal
    }
    
}

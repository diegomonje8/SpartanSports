//
//  ConsejosCell.swift
//  SpartanSports
//
//  Created by MAC on 6/6/21.
//

import UIKit

protocol ConsejosCellDelegate: AnyObject {
    func confirmTapped()
}

class ConsejosCell: BaseTableViewCell<ConsejosGenerale>, ReuseIdentifierInterface {

    weak var delegate: ConsejosCellDelegate!
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
    
    
    @IBAction func clickTapped(_ sender: Any) {
        print("Tapped")
        delegate?.confirmTapped()
    }
}

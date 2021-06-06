//
//  DetailTrainingTitleCell.swift
//  SpartanSports
//
//  Created by MAC on 6/6/21.
//

import UIKit
import Kingfisher

class DetailTrainingTitleCell: BaseTableViewCell<TrainingModelHeader>, ReuseIdentifierInterface {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myTitle: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func configure(cellModel: TrainingModelHeader) {
        self.myTitle.text = cellModel.tituloEjercicio ?? ""
        myImage.kf.setImage(with: URL(string: cellModel.imagenEjercicio!), placeholder: UIImage(named: "placeholder"), options: [.transition(ImageTransition.fade(1))], progressBlock: nil) { result in
            switch result {
                case .success(let value):
                    print(value.image)
                case .failure(let error):
                    print(error)
                }
            
        }
    }
    
}

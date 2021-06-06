//
//  TrainingOneCell.swift
//  SpartanSports
//
//  Created by MAC on 6/6/21.
//

import UIKit
import Kingfisher


protocol TrainingOneCellProtocol {
    func configCell(data: ArrayDiccionariosNivel)
}

class TrainingOneCell: UITableViewCell, ReuseIdentifierInterface {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var layerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func configureCell() {
        layerView.layer.cornerRadius = 8
        layerView.layer.masksToBounds = true
    }
    
}

extension TrainingOneCell : TrainingOneCellProtocol {
    func configCell(data: ArrayDiccionariosNivel) {
        titleLbl.text = data.tituloEjercicio

        myImage.kf.setImage(with: URL(string: data.imagenEjercicio!), placeholder: UIImage(named: "placeholder"), options: [.transition(ImageTransition.fade(1))], progressBlock: nil) { result in
            switch result {
                case .success(let value):
                    
                    print(value.image)

                    // From where the image was retrieved:
                    // - .none - Just downloaded.
                    // - .memory - Got from memory cache.
                    // - .disk - Got from disk cache.
                    print(value.cacheType)

                    // The source object which contains information like `url`.
                    print(value.source)

                case .failure(let error):
                    print(error) // The error happens
                }
            
        }
    }
    
    
}

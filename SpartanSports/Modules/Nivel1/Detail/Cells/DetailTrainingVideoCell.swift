//
//  DetailTrainingVideoCell.swift
//  SpartanSports
//
//  Created by MAC on 7/6/21.
//

import UIKit
import YoutubePlayer_in_WKWebView

class DetailTrainingVideoCell: BaseTableViewCell<TrainingModelVideo>, ReuseIdentifierInterface {

    @IBOutlet weak var videoPlayer: WKYTPlayerView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func configure(cellModel: TrainingModelVideo) {
        if let first = cellModel.arrayEjerciciosResponse?.first {
            self.videoPlayer.load(withVideoId: first)
        }
    }
    
}

//
//  TrainingTwoViewController.swift
//  SpartanSports
//
//  Created by MAC on 30/5/21.
//

import UIKit

protocol TrainingTwoViewControllerProtocol {
    
}

class TrainingTwoViewController: BaseViewController<TrainingTwoPresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuButton()
       
    }
    
}

extension TrainingTwoViewController: TrainingTwoViewControllerProtocol {
    
    
}

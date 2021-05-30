//
//  TrainingOneViewController.swift
//  SpartanSports
//
//  Created by MAC on 30/5/21.
//

import UIKit

protocol TrainingOneViewControllerProtocol {
    
}

class TrainingOneViewController: BaseViewController<TrainingOnePresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuButton()
        
    }
    
}

extension TrainingOneViewController: TrainingOneViewControllerProtocol {
    
    
}

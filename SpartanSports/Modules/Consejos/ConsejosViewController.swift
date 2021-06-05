//
//  ConsejosViewController.swift
//  SpartanSports
//
//  Created by MAC on 1/6/21.
//


import UIKit

protocol ConsejosViewControllerProtocol {
    
}

class ConsejosViewController: BaseViewController<ConsejosPresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
}

extension ConsejosViewController: ConsejosViewControllerProtocol {
    
    
}

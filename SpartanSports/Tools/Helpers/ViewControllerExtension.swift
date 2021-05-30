//
//  ViewControllerExtension.swift
//  SpartanSports
//
//  Created by MAC on 30/5/21.
//

import Foundation

extension UIViewController {
    
    func menuButton() {
        let menuButton = UIBarButtonItem(image: UIImage(named: "menu_Iz"),
                                         style: .plain,
                                         target:revealViewController() ,
                                         action: #selector(SWRevealViewController.revealToggle(_:)))
        revealViewController()?.rightViewRevealWidth = 150
        self.navigationItem.leftBarButtonItem = menuButton
    }
    
}

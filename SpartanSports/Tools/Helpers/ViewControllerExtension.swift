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
        revealViewController()?.panGestureRecognizer()
        self.navigationItem.leftBarButtonItem = menuButton
    }
    
}

//func showIMageMenuWithName(imageMenu: Menu) -> UIImage {
//    switch imageMenu.imagen {
//    case "iconoAvatar": return #imageLiteral(resourceName: "avatar")
//    case "musicAvatar": return #imageLiteral(resourceName: "musicAvatar")
//    case "calendarioAvatar": return #imageLiteral(resourceName: "calendarioAvatar")
//    }
//}

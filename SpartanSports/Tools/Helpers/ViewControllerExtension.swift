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

func showIMageMenuWithName(imageMenu: Menu) -> UIImage {
    switch imageMenu.imagen {
    case "iconoAvatar": return #imageLiteral(resourceName: "avatar")
    case "musicAvatar": return #imageLiteral(resourceName: "musicAvatar")
    case "calendarioAvatar": return #imageLiteral(resourceName: "calendarioAvatar")
    case "consejosAvatar": return #imageLiteral(resourceName: "consejosAvatar")
    default: return #imageLiteral(resourceName: "nosotrosAvatar")
    }
}

func showIMageConsejosWithName(imageConsejo: ConsejosGenerale) -> UIImage {
    switch imageConsejo.image {
    case "icono_obstaculos": return #imageLiteral(resourceName: "workout_58")
    case "icono_carrera": return #imageLiteral(resourceName: "workout_80")
    default: return #imageLiteral(resourceName: "workout_12")
    }
}

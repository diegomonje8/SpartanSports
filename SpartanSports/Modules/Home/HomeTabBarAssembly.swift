//
//  HomeTabBarAssembly.swift
//  SpartanSports
//
//  Created by MAC on 30/5/21.
//

import Foundation
import UIKit

final public class HomeTabBarAssembly {
    
    static func homeTabBarController() -> HomeTabBarController {
        
        let viewController = HomeTabBarController(nibName: HomeTabBarController.defaultResuseIdentifierViewController, bundle: nil)
            
        let oneViewController = TrainingOneAssembly.navigationController()
        let twoViewController = TrainingTwoAssembly.navigationController()
       
        let oneCustomTabBarItem = UITabBarItem(title: nil, image: UIImage(named: "TRIFECA_0M") , selectedImage: UIImage(named: "TRIFECA_0M"))
        let twoCustomTabBarItem = UITabBarItem(title: nil, image: UIImage(named: "TRIFECA_1M") , selectedImage: UIImage(named: "TRIFECA_1M"))
        
        oneViewController.tabBarItem = oneCustomTabBarItem
        twoViewController.tabBarItem = twoCustomTabBarItem
        
        viewController.viewControllers = [oneViewController, twoViewController]
        
        switch viewController.selectedIndex {
        case 0: print("Nivel 1")
        case 1: print("Nivel 2")
        default:
            break
        }

        return viewController
        
    }
    
}

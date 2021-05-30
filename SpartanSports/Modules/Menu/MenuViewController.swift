//
//  MenuViewController.swift
//  SpartanSports
//
//  Created by MAC on 30/5/21.
//

import UIKit

protocol MenuViewControllerProtocol {
    
}

class MenuViewController: BaseViewController<MenuPresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
}

extension MenuViewController: MenuViewControllerProtocol {
    
    
}

//
//  WebViewViewController.swift
//  SpartanSports
//
//  Created by MAC on 1/6/21.
//

import UIKit

protocol WebViewViewControllerProtocol {
    
}

class WebViewViewController: BaseViewController<WebViewPresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
}

extension WebViewViewController: WebViewViewControllerProtocol {
    
    
}

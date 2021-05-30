//
//  SplashViewController.swift
//  SpartanSports
//
//  Created by MAC on 30/5/21.
//

import UIKit

protocol SplashViewControllerProtocol {
    func fetchhDataFromPresent()
}


class SplashViewController: BaseViewController<SplashPresenterProtocol>, ReuseIdentifierInterfaceViewController {

    @IBOutlet weak var imageSplash: UIImageView!
    var expandAnimation : ExpandAnimationProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.fetchMenu()
        self.expandAnimation = ExpandAnimation(image: imageSplash)
    }

}

extension SplashViewController : SplashViewControllerProtocol {
    internal func fetchhDataFromPresent() {
        expandAnimation?.animate {
            self.presenter?.showHomeTabBar()
        }
    }
}





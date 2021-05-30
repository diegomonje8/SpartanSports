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
    var viewAnimator : UIViewPropertyAnimator!
    var unBlockGesture = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.fetchMenu()
    }

    @objc func automaticHandler() {
        viewAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: nil)
        viewAnimator.addAnimations {
            self.imageSplash.transform = CGAffineTransform(scaleX: 60, y: 50)
            self.imageSplash.alpha = 0
        }
        viewAnimator.startAnimation()
        viewAnimator.addCompletion { _ in
            print("Animation finish")
        }
    }
    


}

extension SplashViewController : SplashViewControllerProtocol {
    internal func fetchhDataFromPresent() {
        viewAnimator = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut, animations: nil)
        viewAnimator.addAnimations {
            self.imageSplash.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            self.unBlockGesture = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(self.automaticHandler), userInfo: nil, repeats: false)
        }
        viewAnimator.startAnimation()
        
    }
    
    
}

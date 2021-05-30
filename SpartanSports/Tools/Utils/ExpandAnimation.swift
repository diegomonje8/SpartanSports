//
//  ExpandAnimation.swift
//  SpartanSports
//
//  Created by MAC on 31/5/21.
//

import Foundation
import UIKit

protocol ExpandAnimationProtocol {
    func animate(completion: @escaping() -> ())
}

class ExpandAnimation: ExpandAnimationProtocol {
    
    private var viewAnimator : UIViewPropertyAnimator!
    private var image: UIImageView?
    
    init(image: UIImageView) {
        self.image = image
    }
    
    internal func animate(completion: @escaping() -> ()) {
        viewAnimator = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut, animations: nil)
        viewAnimator.addAnimations {
            self.image?.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        }
        viewAnimator.startAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.viewAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: nil)
            self.viewAnimator.addAnimations {
                self.image?.transform = CGAffineTransform(scaleX: 60, y: 50)
                self.image?.alpha = 0
            }
            self.viewAnimator.startAnimation()
            self.viewAnimator.addCompletion { _ in
                completion()
            }
        }
    }
    
}

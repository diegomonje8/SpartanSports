//
//  BaseViper.swift
//  SpartanSports
//
//  Created by MAC on 28/5/21.
//

import Foundation
import UIKit


class BasePresenter<V, R> {
    
    internal var viewController: V?
    internal var router: R?
    
    convenience init(viewController: V, router: R? = nil) {
        self.init()
        self.viewController = viewController
        self.router = router
    }
    
}

class BaseInteractor<P> {
    
    internal var presenter: P?
    
    convenience init(presenter: P) {
        self.init()
        self.presenter = presenter
    }
    
}


class BaseRouter<P> {
    
    internal var presenter: P?
    internal var viewController: UIViewController?
    
    convenience init(presenter: P, view: UIViewController? = nil) {
        self.init()
        self.presenter = presenter
        self.viewController = view
    }
    
    internal func show(_ vc: UIViewController) {
        if let navigationController = viewController?.navigationController {
            navigationController.pushViewController(vc, animated: true)
        }
    }
    
    internal func present(_ vcToPresent: UIViewController, animated: Bool, completion: (() -> Swift.Void)? = nil) {
        if let navigationController = viewController?.navigationController {
            navigationController.present(vcToPresent, animated: true, completion: completion)
            return
        }
        viewController?.present(vcToPresent, animated: true, completion: completion)
    }
    
}

class BaseNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class BaseViewController<P> : UIViewController {
    var presenter : P?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}



//
//  SplashPresenterImpl.swift
//  SpartanSports
//
//  Created by MAC on 30/5/21.
//

import Foundation


protocol SplashPresenterProtocol {
    func fetchMenu()
}

class SplashPresenterImpl : BasePresenterWithInteractor<SplashViewController, SplashRouterProtocol, SplashInteractorProtocol> {
    
    var viewModel: [MenuResponse] = []
    
}

extension SplashPresenterImpl : SplashPresenterProtocol {
    
    func fetchMenu() {
        self.interactor?.fetchMenu(completion: { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success(let response):
                if let response = response {
                    self?.viewModel.removeAll()
                    self?.viewModel = response
                    self?.viewController?.fetchhDataFromPresent()
                }
            case .failure(let error):
                print ("Error \(error?.localizedDescription ?? "Error")")
            }
        })
    }
    
}

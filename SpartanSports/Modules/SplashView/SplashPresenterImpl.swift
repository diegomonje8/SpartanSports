//
//  SplashPresenterImpl.swift
//  SpartanSports
//
//  Created by MAC on 30/5/21.
//

import Foundation


protocol SplashPresenterProtocol {
    func fetchMenu()
    func showHomeTabBar()
}

class SplashPresenterImpl : BasePresenterWithInteractor<SplashViewController, SplashRouterProtocol, SplashInteractorProtocol> {
    
    var viewModel: [MenuResponse] = []
    
}

extension SplashPresenterImpl : SplashPresenterProtocol {
    func showHomeTabBar() {
        self.router?.showHomeTabBar(dataMenu: viewModel)
    }
    
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
                else {print("No data in Menu")}
            case .failure(let error):
                print ("Error \(error?.localizedDescription ?? "Error")")
            }
        })
    }
    
}

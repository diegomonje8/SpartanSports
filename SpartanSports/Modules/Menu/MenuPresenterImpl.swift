// MenuPresenter.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol MenuPresenterProtocol {
    func getNumberOfRowsInSection() -> Int
    func getInformationObject(indexPath: Int) -> Menu?
    func showWebSite()
    func fecthConsejos()
    func navigateToConsejos()
}

class MenuPresenterImpl: BasePresenter<MenuViewControllerProtocol, MenuRouterProtocol> {
    
    var interactor: MenuInteractorProtocol?
    var dataMenu : [MenuResponse] = []
    var dataConsejos: [ConsejosGenerale] = []
    
    internal func getNumberOfRowsInSection() -> Int {
        self.dataMenu.count
    }
    
    internal func getInformationObject(indexPath: Int) -> Menu? {
        self.dataMenu[indexPath].menu
    }
    
}


extension MenuPresenterImpl: MenuPresenterProtocol {
    func navigateToConsejos() {
        router?.navigateToConsejosRouter(dataConsejos: dataConsejos)
    }
    
    func fecthConsejos() {
        self.interactor?.fecthConsejos(completion: { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success(let response):
                if let response = response {
                    self?.dataConsejos.removeAll()
                    self?.dataConsejos = response
                }
            case .failure(let error):
                print(error?.localizedDescription ?? "Error fetching Consejos")
            }
            
        })
    }
    
    func showWebSite() {
        self.router?.showDefaultAlert(delegate: self, model: DefaultAlertViewModel(type: .confirmationNavigation))
    }
}

extension MenuPresenterImpl : AlertDefaultViewControllerDelegate {
    func defaultPrimaryButtonPressed(type: DefaultAlertType) {
        self.router?.showWebSiteInRouter()
    }
    
    func defaultSecondaryButtonPressed(type: DefaultAlertType) {
        print("Cancel")
    }
    
}

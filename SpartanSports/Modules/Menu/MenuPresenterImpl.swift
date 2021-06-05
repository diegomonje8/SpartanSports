// MenuPresenter.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol MenuPresenterProtocol {
    func getNumberOfRowsInSection() -> Int
    func getInformationObject(indexPath: Int) -> Menu?
}

class MenuPresenterImpl: BasePresenter<MenuViewControllerProtocol, MenuRouterProtocol> {
    
    var interactor: MenuInteractorProtocol?
    var dataMenu : [MenuResponse] = []
    
    internal func getNumberOfRowsInSection() -> Int {
        self.dataMenu.count
    }
    
    internal func getInformationObject(indexPath: Int) -> Menu? {
        self.dataMenu[indexPath].menu
    }
    
}


extension MenuPresenterImpl: MenuPresenterProtocol {
    func showWebSiteRouter() {
        
    }
    
    
   
  
}

// WebViewPresenter.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol WebViewPresenterProtocol {
   
}

class WebViewPresenterImpl: BasePresenter<WebViewViewControllerProtocol, WebViewRouterProtocol> {
    
    var interactor: WebViewInteractorProtocol?
    
}


extension WebViewPresenterImpl: WebViewPresenterProtocol {
    
  
}

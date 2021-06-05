// WebViewInteractor.swift
// Architecture VIP+UI
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol WebViewInteractorProtocol {
    
}

class WebViewInteractorImpl: BaseInteractor<WebViewPresenterProtocol> {
    
    var provider: WebViewProviderProtocol = WebViewProviderImpl()
    
}

extension WebViewInteractorImpl: WebViewInteractorProtocol {
    
}

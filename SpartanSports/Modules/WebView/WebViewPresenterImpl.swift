// WebViewPresenter.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation
import WebKit

protocol WebViewPresenterProtocol {
   func loadDataInWebView()
}

class WebViewPresenterImpl: BasePresenter<WebViewViewControllerProtocol, WebViewRouterProtocol> {
    
    var interactor: WebViewInteractorProtocol?
    
}


extension WebViewPresenterImpl: WebViewPresenterProtocol {
    func loadDataInWebView() {
        #if DEV
        let url = "https://www.planttext.co/"
        #elseif PRE
        let url = "https://www.google.es"
        #elseif PRO
        let url = "https://www.google.es"
        #endif
        self.viewController?.loadWebView(data: url)
    }
    
    
  
}

extension WebViewPresenterImpl : WebKitPresenterProtocol {
    
    func webViewProvisionigNavigation(_ webView: WKWebView, navigation: WKNavigation!) {
        //self.viewController?.loadActivityIndicator(show: true)
    }
    
    func webViewNavigationFailed(_ webView: WKWebView, navigation: WKNavigation!, error: Error) {
        self.viewController?.loadActivityIndicator(show: false)
    }
    
    func webViewNavigationActionResponse(_ webView: WKWebView, response: WKNavigationResponse, handler: @escaping (WKNavigationResponsePolicy) -> ()) {
        handler(.allow)
    }
    
    func webViewNavigationActionRequest(_ webView: WKWebView, actionRequest: WKNavigationAction, handler: @escaping (WKNavigationActionPolicy) -> ()) {
        handler(.allow)
    }
    
    func webViewDidFinish(_ webView: WKWebView, navigation: WKNavigation!) {
        self.viewController?.loadActivityIndicator(show: false)
    }
    
}

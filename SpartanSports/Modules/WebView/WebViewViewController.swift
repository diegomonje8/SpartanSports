//
//  WebViewViewController.swift
//  SpartanSports
//
//  Created by MAC on 1/6/21.
//

import UIKit
import WebKit

protocol WebViewViewControllerProtocol {
    func loadWebView(data: String)
    func loadActivityIndicator(show: Bool)
}

class WebViewViewController: BaseViewController<WebViewPresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    var myWebViewInContainer: WKWebView!
    var webViewManager: WebViewManager?
    
    @IBOutlet weak var myWebView: UIView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configWebView()
        self.presenter?.loadDataInWebView()
       
    }
    
    private func configWebView() {
        self.title = "Cice Sports"
        self.myActivityIndicator.isHidden = false
        self.myActivityIndicator.startAnimating()
        let contentVC = WKUserContentController()
        let config = WKWebViewConfiguration()
        let preference = WKWebpagePreferences()
        
        
        preference.allowsContentJavaScript = true
        self.myWebViewInContainer = WKWebView(frame: self.myWebView.bounds, configuration: config)
        self.myWebViewInContainer.configuration.userContentController = contentVC
        self.myWebView.addSubview(self.myWebViewInContainer)
        self.webViewManager = WebViewManager(pWebView: self.myWebViewInContainer, pPresenter: self.presenter)
    }
    
}

extension WebViewViewController: WebViewViewControllerProtocol {
    func loadActivityIndicator(show: Bool) {
        
        if show {
            self.myActivityIndicator.isHidden = !show
            self.myActivityIndicator.startAnimating()
        } else {
            self.myActivityIndicator.stopAnimating()
            self.myActivityIndicator.isHidden = !show
        }
    }
    
    
    
    func loadWebView(data: String) {
        self.myWebViewInContainer.load(URLRequest(url: URL(string: data)!))
    }
    
    
    
    
}

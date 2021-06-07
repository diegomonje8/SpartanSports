//
//  WebKitPresenterProtocol.swift
//  SpartanSports
//
//  Created by MAC on 7/6/21.
//

import Foundation
import WebKit


protocol WebKitPresenterProtocol: AnyObject {
    
    func webViewProvisionigNavigation(_ webView: WKWebView, navigation: WKNavigation!)
    func webViewDidFinish(_ webView:WKWebView, navigation: WKNavigation!)
    func webViewNavigationActionRequest(_ webView: WKWebView, actionRequest: WKNavigationAction, handler: @escaping (WKNavigationActionPolicy) -> ())
    func webViewNavigationActionResponse(_ webView: WKWebView, response: WKNavigationResponse, handler: @escaping (WKNavigationResponsePolicy) -> ())
    func webViewNavigationFailed(_ webView: WKWebView, navigation: WKNavigation!, error: Error)
    
}

extension WebKitPresenterProtocol {
    func webViewProvisionigNavigation(_ webView: WKWebView, navigation: WKNavigation!) {}
    func webViewDidFinish(_ webView:WKWebView, navigation: WKNavigation!) {}
    func webViewNavigationActionRequest(_ webView: WKWebView, actionRequest: WKNavigationAction, handler: @escaping (WKNavigationActionPolicy) -> ()) {}
    func webViewNavigationActionResponse(_ webView: WKWebView, response: WKNavigationResponse, handler: @escaping (WKNavigationResponsePolicy) -> ()) {}
    func webViewNavigationFailed(_ webView: WKWebView, navigation: WKNavigation!, error: Error) {}
}

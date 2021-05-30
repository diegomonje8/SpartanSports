//
//  RequestDTO.swift
//  SpartanSports
//
//  Created by MAC on 30/5/21.
//

import Foundation


enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

struct URLEndpoint {
    
    static let baseURL = "https://app-whiteoxsports-123456.herokuapp.com/"
    
    static let endpointMenu = baseURL + "iCoMenuResponse"
    static let endpointConsejos = baseURL + "iCoConsejosResponse"
    
}

struct AuthHeroku {
    static let authHeroku = "Bearer 123456789"
    
}

struct RequestDTO {
    var params : [String: Any]?
    var paramasArray : [[String : Any]]?
    var method: HTTPMethods
    var endpoint: String
    
    init(params: [String: Any]?, method: HTTPMethods, endpoint: String) {
        self.params = params
        self.method = method
        self.endpoint = endpoint
    }
    
    init(paramasArray: [[String: Any]]?, method: HTTPMethods, endpoint: String) {
        self.paramasArray = paramasArray
        self.method = method
        self.endpoint = endpoint
    }
}


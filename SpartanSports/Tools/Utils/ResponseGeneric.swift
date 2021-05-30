//
//  ResponseGeneric.swift
//  SpartanSports
//
//  Created by MAC on 30/5/21.
//

import Foundation

public enum ResponseGeneric <T, ApiError> {
    
    case success(T?)
    case failure(ApiError?)
    
}

public enum ResponseArray <T, ApiError> {
    
    case success([T]?)
    case failure(ApiError?)
    
}

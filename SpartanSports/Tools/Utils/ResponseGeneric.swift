//
//  ResponseGeneric.swift
//  SpartanSports
//
//  Created by MAC on 30/5/21.
//

import Foundation

public enum ResponseGeneric <T: Any, ApiError> {
    
    case success(T?)
    case failure(ApiError?)
    
}

public enum ResponseArray <T: Any, ApiError> {
    
    case success([T]?)
    case failure(ApiError?)
    
}

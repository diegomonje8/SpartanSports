//
//  Utils.swift
//  SpartanSports
//
//  Created by MAC on 30/5/21.
//

import Foundation

enum ApiError: Error, LocalizedError {
    
    case unknown
    case apiError(reason: String)
    
    var errorDescription: String? {
        switch self {
        case .unknown: return "Unknown error"
        case .apiError(reason: let error): return error
        }
    }
    
}





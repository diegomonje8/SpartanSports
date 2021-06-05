//
//  LocalizeKeys.swift
//  SpartanSports
//
//  Created by MAC on 1/6/21.
//

import Foundation

struct LocalizeKeys {
    
    struct General {
        static let titleAlertDefault = "title_my_alert".localized
        static let messageAlertDefault = "message_my_alert".localized
        static let primaryButtonAlertDefault = "general_accept".localized
        static let secondaryButtonAlertDefault = "general_cancel".localized
        
    }
    
}

extension String {
    public var localized : String {
        return NSLocalizedString(self, comment: "")
    }
}

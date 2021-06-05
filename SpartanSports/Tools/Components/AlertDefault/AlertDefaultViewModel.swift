//
//  AlertDefaultViewModel.swift
//  SpartanSports
//
//  Created by MAC on 1/6/21.
//

import Foundation

@objc enum DefaultAlertType: Int {
    case confirmationNavigation
    case none
}

struct DefaultAlertViewModel {
    var type: DefaultAlertType?
    
    //Confrimation Navigation
    var confirmationTitle = LocalizeKeys.General.titleAlertDefault
    var confirmationMessage = LocalizeKeys.General.messageAlertDefault
    var confirmationPrimaryButton = LocalizeKeys.General.primaryButtonAlertDefault
    var confirmationSecondaryButton = LocalizeKeys.General.secondaryButtonAlertDefault
    
    init(type: DefaultAlertType) {
        self.type = type
    }
    
}

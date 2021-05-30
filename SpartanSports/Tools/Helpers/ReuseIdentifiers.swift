//
//  ReuseIdentifiers.swift
//  SpartanSports
//
//  Created by MAC on 30/5/21.
//

import Foundation
import UIKit

public protocol ReuseIdentifierInterface: AnyObject {
    static var defaultResuseIdentifier: String { get }
}

public extension ReuseIdentifierInterface where Self: UIView {
    static var defaultResuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

public protocol ReuseIdentifierInterfaceViewController: AnyObject {
    static var defaultResuseIdentifierViewController: String { get }
}

public extension ReuseIdentifierInterfaceViewController where Self: UIViewController {
    static var defaultResuseIdentifierViewController: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

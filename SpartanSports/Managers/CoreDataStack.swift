//
//  CoreDataStack.swift
//  SpartanSports
//
//  Created by MAC on 31/5/21.
//

import Foundation




class CoreDataStack {
    
    static let shared = CoreDataStack()
    private let defaults = UserDefaults.standard
    private let defaultsKey = "lastReefresh"
    private let calender = Calendar.current
    let defaultFirstTime  = "firstTime"
    
    private init() {}
    
    
    
    func loadDataIfNeeded(completionHandler: (Bool) -> ()) {
        if isRefreshingRequired() {
            defaults.set(Date(), forKey: defaultsKey)
            completionHandler(true)
        } else {
            completionHandler(false)
        }
        
    }
    
//    func isFirstTime(completionHandler: (Bool) -> ()) {
//        let aux = defaults.value(forKey: defaultFirstTime)
//        if aux == nil {
//            completionHandler(true)
//            setupValueFirstTime()
//        }
//        else {
//            completionHandler(false)
//        }
//    }
    
     func setupValueFirstTime() {
        UserDefaults.standard.set(false, forKey: defaultFirstTime)
    }
    
    private func isRefreshingRequired() -> Bool {
        
        guard let lastRefreshing  = defaults.object(forKey: defaultsKey) as? Date else { return true }
       
        if let dif2 = calender.dateComponents([.hour], from: lastRefreshing, to: Date()).hour {
            let dif = 24 - Int(dif2)
            print("--> TIME REMAING TO REFRESH: \(dif)")
        }
        
        if let diff = calender.dateComponents([.hour], from: lastRefreshing, to: Date()).hour, diff > 24 {
            return true
        }
        return false
    }
    
    func setData<T>(data: [T], type: CoreDataStackTypes) {
        switch type {
        case .menu:
            if let data = data as? [MenuResponse] {
                saveData(data: data, key: CoreDataStack.Constants.menu)
            }
        case .consejos:
            if let data = data as? [ConsejosGenerale] {
                saveData(data: data, key: CoreDataStack.Constants.consejos)
            }
        }
    }
    
    private func saveData<T: Encodable>(data: T, key: String) {
        do {
            UserDefaults.standard.set(try PropertyListEncoder().encode(data), forKey: key)
        } catch let error {
            print (error)
        }
    }
    
    func getData<T: Decodable>(type: T.Type) -> [T] {
        var key : String = ""
        
        switch type {
        case is MenuResponse.Type: key = CoreDataStack.Constants.menu
        case is ConsejosGenerale.Type: key = CoreDataStack.Constants.consejos
        default: break
        }
        if let data = UserDefaults.standard.value(forKey: key) as? Data {
            do {
                return try PropertyListDecoder().decode([T].self, from: data)
            }
            catch let error {
                print(error)
            }
        }
       return []
    }

}

private extension CoreDataStack {
    struct Constants {
        static let menu = "menu"
        static let consejos = "consejos"
    }
}

enum CoreDataStackTypes : String {
    case menu = "menu"
    case consejos = "consejos"
}

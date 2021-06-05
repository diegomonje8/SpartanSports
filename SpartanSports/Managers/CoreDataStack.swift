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
    
    func isFirstTime(completionHandler: (Bool) -> ()) {
        let aux = defaults.value(forKey: defaultFirstTime)
        if aux == nil {
            completionHandler(true)
            setupValueFirstTime()
        }
        else {
            completionHandler(false)
        }
    }
    
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
    
    //Gestión de datos. BBDD
    func setMenu(data: [MenuResponse])  {

        do {
            UserDefaults.standard.set(try PropertyListEncoder().encode(data), forKey: CoreDataStack.Constants.menu)
        } catch let error {
            print (error)
        }
    }
    
    func getMenu() -> [MenuResponse]? {
        var myData : [MenuResponse] = []
        if let data = UserDefaults.standard.value(forKey: CoreDataStack.Constants.menu) as? Data {
            do {
                myData = try PropertyListDecoder().decode([MenuResponse].self, from: data)
            }
            catch let error {
                print(error)
            }
        }
        else {
            return nil
        }
        return myData
        
    }
    
    func setConsejos(data: [ConsejosGenerale])  {

        do {
            UserDefaults.standard.set(try PropertyListEncoder().encode(data), forKey: CoreDataStack.Constants.consejos)
        } catch let error {
            print (error)
        }
    }
    
    func setMenu() -> [ConsejosGenerale]? {
        var myData : [ConsejosGenerale] = []
        if let data = UserDefaults.standard.value(forKey: CoreDataStack.Constants.consejos) as? Data {
            do {
                myData = try PropertyListDecoder().decode([ConsejosGenerale].self, from: data)
            }
            catch let error {
                print(error)
            }
        }
        else {
            return nil
        }
        return myData
        
    }
    
    
}

private extension CoreDataStack {
    struct Constants {
        static let menu = "menu"
        static let consejos = "consejos"
    }
}

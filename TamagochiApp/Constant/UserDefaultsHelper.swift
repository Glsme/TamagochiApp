//
//  UserDefaultsHelper.swift
//  TamagochiApp
//
//  Created by Seokjune Hong on 2022/08/01.
//

import Foundation

///User Defaults Helper Class Designed Singleton Pattern
class UserDefaultsHelper {
    
    private init() { }
    
    static let standard = UserDefaultsHelper()
    
    let userDefaults = UserDefaults.standard
    
    enum Key: String {
        case userName, rice, water, first
    }
    
    var userName: String {
        get {
            return userDefaults.string(forKey: Key.userName.rawValue) ?? "대장"
        }
        
        set {
            userDefaults.set(newValue, forKey: Key.userName.rawValue)
        }
    }
    
    var rice: Int {
        get {
            return userDefaults.integer(forKey: Key.rice.rawValue)
        }
        
        set {
            userDefaults.set(newValue, forKey: Key.rice.rawValue)
        }
    }
    
    var water: Int {
        get {
            return userDefaults.integer(forKey: Key.water.rawValue)
        }
        
        set {
            userDefaults.set(newValue, forKey: Key.water.rawValue)
        }
    }
    
    var first: Bool {
        get {
            return userDefaults.bool(forKey: Key.first.rawValue)
        }
        
        set {
            userDefaults.set(newValue, forKey: Key.first.rawValue)
        }
    }
}

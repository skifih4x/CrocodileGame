//
//  UserSettings.swift
//  CrocodileGame
//
//  Created by Николай on 18.04.2023.
//

import Foundation

final class UserSettings {
    
    private enum SettingsKeys: String {
        case userName
        case userModel
    }
    
    static var userModel: UserModel! {
        get {
            guard let savedData = UserDefaults.standard.object(forKey: SettingsKeys.userModel.rawValue) as? Data, let decodedModel = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData) as? UserModel else {
                return nil }
            return decodedModel
            }
        set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.userModel.rawValue
            
            if let userModel = newValue {
                if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: userModel, requiringSecureCoding: false) {
                    defaults.set(savedData, forKey: key)
                }
            }
        }
    }
    
    static var userName: String! {
        
        get {
            return UserDefaults.standard.string(forKey: SettingsKeys.userName.rawValue)
            
        } set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.userName.rawValue
            if let name = newValue {
                print("\(name)  \(key)")
                defaults.set(name, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
}

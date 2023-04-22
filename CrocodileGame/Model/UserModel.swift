//
//  UserMoel.swift
//  CrocodileGame
//
//  Created by Николай on 18.04.2023.
//

import Foundation

class Base {
    let defaults = UserDefaults.standard
    static let shared = Base()
    struct Users: Codable {
        var name: String
        var points: Int
    }
    
    var full: [Users] {
        get {
            if let data = defaults.value(forKey: "users") as? Data {
                if let users = try? PropertyListDecoder().decode([Users].self, from: data) {
                    return users
                }
            }
            return [Users]()
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: "users")
            }
        }
    }
    
    func saveTeam(name: String, points: Int) {
        if let existingUser = full.first(where: { $0.name == name }) {
            let updatedUser = Users(name: name, points: existingUser.points + points)
            full = full.filter { $0.name != name } + [updatedUser]
        } else {
            let user = Users(name: name, points: points)
            full.append(user)
        }
    }

}

//
//  UserMoel.swift
//  CrocodileGame
//
//  Created by Николай on 18.04.2023.
//

import Foundation

class Base {
    let defaults = UserDefaults.standard
    static var shared = Base()
    struct Users: Codable {
        var name: String
        var points: Int
    }
    var full: [Users] {
        get {
            if let data = defaults.value(forKey: "users") as? Data {
               return try! PropertyListDecoder().decode([Users].self, from: data)
            } else {
               return [Users]()
            }
        } set {
            if let data = try? PropertyListEncoder().encode(newValue) {
              return  defaults.set(data, forKey: "users")
            }
        }
    }
    func saveTeam (name: String, points: Int) {
        let user = Users(name: name, points: points)
        full.append(user)
        print(user)
    }
}


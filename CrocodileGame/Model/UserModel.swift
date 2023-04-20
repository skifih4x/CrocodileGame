//
//  UserMoel.swift
//  CrocodileGame
//
//  Created by Николай on 18.04.2023.
//

import Foundation
//
//class Base {
//    let defaults = UserDefaults.standard
//    static let shared = Base()
//    
//    struct Team: Codable {
//        var team: String
//        var point: Int
//    }
//    var teamDict: [Team] {
//        get {
//            if let data = defaults.value(forKey: "teamDict") as? Data {
//                return try! PropertyListDecoder().decode([Team].self, from: data)
//            } else {
//                return [Team]()
//            }
//        }
//        
//        set {
//            if let data = try? PropertyListEncoder().encode(newValue) {
//                defaults.set(data, forKey: "teamDict")
//            }
//        }
//    }
//    
//    func saveTeam(team: String, points: Int) {
//        let team = Team(team: team, point: points)
//        teamDict.append(team)
//        print(team)
//    }
//}


//class UserModel: NSObject, NSCoding {
//
//    var name: [String: Int] = [:]
////    let points: Int
//
//    init(name: [String: Int]) {
//        self.name = name
////        self.points = [points]
//    }
//
//    func encode(with coder: NSCoder) {
//        coder.encode(name, forKey: "name")
////        coder.encode(points, forKey: "points")
//    }
//
//    required init?(coder: NSCoder) {
//        name = coder.decodeObject(forKey: "name") as? [String: Int] ?? [:]
////        points = coder.decodeObject(forKey: "points") as? [Int] ?? [0]
//    }
//}

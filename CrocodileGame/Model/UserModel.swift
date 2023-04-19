//
//  UserMoel.swift
//  CrocodileGame
//
//  Created by Николай on 18.04.2023.
//

import Foundation

class UserModel: NSObject, NSCoding {

    let name: [String]
    let points: [Int]
    
    init(name: String, points: Int) {
        self.name = [name]
        self.points = [points]
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(points, forKey: "points")
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as? [String] ?? []
        points = coder.decodeObject(forKey: "points") as? [Int] ?? [0]
    }
}

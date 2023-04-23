//
//  Image.swift
//  CrocodileGame
//
//  Created by Николай on 17.04.2023.
//

import UIKit

extension UIImageView {
    
    static var background: UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }
    
    static var crocodile: UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: "pngwing")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }
    
    static var grass: UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: "grass")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }
}

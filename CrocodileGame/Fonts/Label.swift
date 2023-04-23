//
//  Label.swift
//  CrocodileGame
//
//  Created by Николай on 17.04.2023.
//

import Foundation
import UIKit

extension UILabel {
    
    static var CookieRegular: UILabel {
        let label = UILabel(frame: .zero)
        label.font = Resources.Fonts.CookieRegular(with: 20)
        return label
    }
    
    
}

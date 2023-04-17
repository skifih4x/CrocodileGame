//
//  Label.swift
//  CrocodileGame
//
//  Created by Николай on 17.04.2023.
//

import Foundation
import UIKit

extension UILabel {
    
    static var buhavkaWhite: UILabel {
        let label = UILabel(frame: .zero)
        label.font = Resources.Fonts.Bhavuka(with: 20)
        return label
    }
    
    
}

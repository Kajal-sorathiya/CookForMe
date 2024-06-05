//
//  Extension.swift
//  CookForMe
//
//  Created by Ahir on 04/04/24.
//

import Foundation
import UIKit

extension UILabel {
    func setupLabel(_ textColor: UIColor, text: String, font: UIFont? = Fonts.latoBold_12) {
        self.text = text
        self.textColor = textColor
        self.font = font
    }
}

//
//  Extensions+UITextfield.swift
//  CookForMe
//
//  Created by Ahir on 04/04/24.
//

import Foundation
import UIKit

extension UITextField {
    func setupTextField(with cornerRadius: CGFloat, placeholder: String) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        self.attributedPlaceholder = setupAttributedPlaceholder(text: placeholder,
                                                                font: Fonts.latoBold_18,
                                                                foregroundColor: CookMeColors.gray)
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
        self.leftViewMode = .always
        self.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
        self.rightViewMode = .always
    }
    
    func setupAttributedPlaceholder(text: String,
                                    font: UIFont,
                                    foregroundColor: UIColor) -> NSAttributedString {
        return NSAttributedString(string: text,
                                  attributes: [
                                    NSAttributedString.Key.font: font,
                                    NSAttributedString.Key.foregroundColor: foregroundColor
                                  ])
    }
}

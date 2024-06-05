//
//  Extension+UIButton.swift
//  CookForMe
//
//  Created by Ahir on 04/04/24.
//

import Foundation
import UIKit

extension UIButton {
    func setupButton(with text: String? = nil,
                     textColor: UIColor? = nil,
                     backgroundColor: UIColor? = nil,
                     cornerRadius: CGFloat? = 0,
                     font: UIFont? = nil,
                     strImg: String? = nil,
                     img: UIImage? = nil,
                     tintColor: UIColor? = nil)
    {
        self.setTitle(text, for: .normal)
        self.setTitleColor(textColor, for: .normal)
        self.backgroundColor = backgroundColor
        if cornerRadius != nil { self.layer.cornerRadius = cornerRadius! }
        self.titleLabel?.font = font
        if let strImg {
            self.setImage(UIImage(named: strImg), for: .normal)
        }
        if let img { self.setImage(img, for: .normal)}
        if let tintColor {
            self.tintColor = tintColor
        }
    }
}

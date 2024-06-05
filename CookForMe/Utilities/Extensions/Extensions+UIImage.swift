//
//  Extensions+UIImage.swift
//  CookForMe
//
//  Created by Ahir on 13/04/24.
//

import UIKit

extension UIImageView {
    func setupImages(_ image: String? = nil, cornerRadius: CGFloat = 0, backgroundColor: UIColor = CookMeColors.clearColor, systemImgName: String? = nil, tintColor : UIColor? = nil) {
        self.layer.cornerRadius = cornerRadius
        if let image { self.image = UIImage(named: image) }
        self.backgroundColor = backgroundColor
        if let tintColor {
            self.tintColor = tintColor
        }
        if let systemImgName { self.image = UIImage(systemName: systemImgName) }
    }
}

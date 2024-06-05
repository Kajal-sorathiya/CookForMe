//
//  Extension+UIView.swift
//  CookForMe
//
//  Created by Ahir on 08/04/24.
//

import Foundation
import UIKit

extension UIView {
    
    func setUpView(bgColor: UIColor, roundCorners: UIRectCorner = [], radius: CGFloat = 0) {
        self.backgroundColor = bgColor
        self.clipsToBounds = true
        if !roundCorners.isEmpty {
            makeUpRoundCorners(corners: roundCorners,
                               radius: radius)
        }
    }
    
    func addCornerRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
    
    private func makeUpRoundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    static var identifier: String {
        return String(describing: self.self)
    }
}

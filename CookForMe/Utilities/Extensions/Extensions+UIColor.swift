//
//  Extensions+UIColor.swift
//  CookForMe
//
//  Created by Ahir on 04/04/24.
//

import Foundation

import UIKit

extension UIColor {
    convenience init(_ hex: String, alpha: CGFloat = 1.0) {
        var cleanedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanedHex = cleanedHex.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        guard Scanner(string: cleanedHex).scanHexInt64(&rgb) else {
            self.init(red: 1.0, green: 1.0, blue: 1.0, alpha: alpha) // Return white on incorrect input
            return
        }

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

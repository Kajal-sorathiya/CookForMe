//
//  Constant+Font.swift
//  CookForMe
//
//  Created by Ahir on 10/04/24.
//

import Foundation
import UIKit

struct Fonts {
    static let latoBold_8 = cookItFont(name: FontName.latoBold, size: 8)
    static let latoRegular_8 = cookItFont(name: FontName.latoRegular, size: 8)
    
    static let latoBold_12 = cookItFont(name: FontName.latoBold, size: 12)
    static let latoRegular_12 = cookItFont(name: FontName.latoRegular, size: 12)
    
    static let latoRegular_15 = cookItFont(name: FontName.latoRegular, size: 15)
    static let latoBold_15 = cookItFont(name: FontName.latoBold, size: 15)
    
    static let latoBold_18 = cookItFont(name: FontName.latoBold, size: 18)
    static let latoRegular_18 = cookItFont(name: FontName.latoRegular, size: 18)
    
    static let latoRegular_24 = cookItFont(name: FontName.latoBold, size: 24)
    
    static let latoBold_35 = cookItFont(name: FontName.latoBold, size: 35)
    static let latoBold_30 = cookItFont(name: FontName.latoBold, size: 30)

    private static func cookItFont(name: FontName, size: Int) -> UIFont {
        return UIFont(name: name.fontName, size: size.sizeInRespectToScreenWidth()) ?? UIFont()
    }
}

enum FontName: String {
    case latoRegular = "Lato-Regular"
    case latoBold = "Lato-Bold"
    case latoItalic = "Lato-Italic"
    
    var fontName: String {
        return self.rawValue
    }
}

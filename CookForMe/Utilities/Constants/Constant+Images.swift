//
//  Constant+Images.swift
//  CookForMe
//
//  Created by Ahir on 13/04/24.
//

import UIKit

enum AppImages: String {
    case logoImg = "CookForMe"
    case profileImg = "profile_photo"
    
    var img: UIImage? {
        return UIImage(named: rawValue)
    }
    
    var name: String {
        return self.rawValue
    }
}

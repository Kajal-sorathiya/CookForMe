//
//  Extension+Number.swift
//  CookForMe
//
//  Created by Ahir on 10/04/24.
//

import Foundation
import UIKit

extension Int {
    func sizeInRespectToScreenWidth() -> CGFloat {
        return (UIScreen.main.bounds.size.width) * CGFloat(self) / 375
    }
}

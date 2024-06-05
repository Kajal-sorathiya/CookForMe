//
//  TitleCell.swift
//  CookForMe
//
//  Created by Ahir on 01/06/24.
//

import UIKit

class TitleCell: UITableViewCell {
    
    // MARK: Outlet
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var imgTimer: UIImageView!
    @IBOutlet private weak var lblTime: UILabel!
    @IBOutlet private weak var levelView: UIView!
    @IBOutlet private weak var lblLevel: UILabel!
    
    // MARK: Life cycle methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
        backgroundColor = CookMeColors.clearColor
    }
    
    // MARK: Config methods
    func config(with data: RecipeDetail?) {
        // Title
        lblTitle.setupLabel(CookMeColors.white, text: data?.recipeTitle ?? "", font: Fonts.latoRegular_24)
        
        // Timer
        imgTimer.setupImages(systemImgName: "clock", tintColor: CookMeColors.orangeThemeColor)
        lblTime.setupLabel(CookMeColors.orangeThemeColor, text: data?.recipeMakeTime ?? "")
        
        // Level View
        levelView.setUpView(bgColor: CookMeColors.creamColor)
        levelView.addCornerRadius(10)
        lblLevel.setupLabel(CookMeColors.black, text: data?.recipeLevel ?? "")
    }
}

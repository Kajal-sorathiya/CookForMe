//
//  TableTitlesCell.swift
//  CookForMe
//
//  Created by Ahir on 02/06/24.
//

import UIKit

class TableTitlesCell: UITableViewCell {

    // MARK: Outles
    @IBOutlet private weak var lblIngredients: UILabel!
    @IBOutlet private weak var lblDesc: UILabel!
    @IBOutlet private weak var lblReview: UILabel!
    
    // MARK: Variables
    
    // MARK: Life cycle methods
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        backgroundColor = CookMeColors.clearColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Config methods
    func config(with recipeDetail: RecipeDetail?) {
        lblIngredients.setupLabel(CookMeColors.green,
                                  text: recipeDetail?.ingredientsTitle ?? "",
                                  font: Fonts.latoBold_15)
        lblDesc.setupLabel(CookMeColors.white,
                           text: recipeDetail?.descriptionTitle ?? "",
                           font: Fonts.latoBold_15)
        lblReview.setupLabel(CookMeColors.white,
                             text: recipeDetail?.reviewTitle ?? "",
                             font: Fonts.latoBold_15)
    }
}

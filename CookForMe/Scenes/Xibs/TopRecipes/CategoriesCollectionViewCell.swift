//
//  TopRecipeCollectionViewCell.swift
//  CookForMe
//
//  Created by Ahir on 30/04/24.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
// MARK: IBOutlet
    
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var imgRecipe: UIImageView!
    @IBOutlet private weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func config(with category: Categories) {
        bgView.setUpView(bgColor: CookMeColors.black, roundCorners: [.bottomLeft, .bottomRight, .topRight, .topLeft])
        bgView.layer.cornerRadius = 20
        lblTitle.setupLabel(CookMeColors.white,
                            text: category.title)
        imgRecipe.setupImages(category.img, cornerRadius: imgRecipe.frame.size.height / 2)
    }
}

struct Categories {
    let title: String
    let img: String
}

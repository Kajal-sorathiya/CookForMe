//
//  RecipesCell.swift
//  CookForMe
//
//  Created by Ahir on 02/06/24.
//

import UIKit

class RecipesCell: UITableViewCell {
    
    // MARK: Outlets
    
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var lblWeight: UILabel!
    @IBOutlet private weak var img: UIImageView!
    
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
    func config(with recipe: recipes?) {
        img.setupImages(recipe?.img, cornerRadius: img.frame.size.height / 2)
        img.contentMode = .scaleAspectFill
        img.backgroundColor = CookMeColors.clearColor
        lblTitle.setupLabel(CookMeColors.white, text: recipe?.name ?? "")
        lblWeight.setupLabel(CookMeColors.white, text: recipe?.weight ?? "")
    }
}

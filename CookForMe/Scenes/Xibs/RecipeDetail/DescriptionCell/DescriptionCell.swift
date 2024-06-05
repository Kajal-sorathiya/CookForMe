//
//  DescriptionCell.swift
//  CookForMe
//
//  Created by Ahir on 02/06/24.
//

import UIKit

class DescriptionCell: UITableViewCell {

    // MARK: Outlets
    @IBOutlet private weak var lblDesc: UILabel!
    
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
    func config(with strDesc: String) {
        lblDesc.setupLabel(CookMeColors.gray, text: strDesc, font: Fonts.latoBold_15)
    }
}

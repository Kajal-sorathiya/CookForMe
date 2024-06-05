//
//  CookNowCell.swift
//  CookForMe
//
//  Created by Ahir on 02/06/24.
//

import UIKit

class CookNowCell: UITableViewCell {

    // MARK: Outlets
    @IBOutlet private weak var btnCookNow: UIButton!
    
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
    func config(with strName: String) {
        print("Adding changes to the remote repo")
        btnCookNow.setupButton(with: strName,
                               textColor: CookMeColors.white,
                               backgroundColor: CookMeColors.orangeThemeColor,
                               cornerRadius: btnCookNow.frame.height / 2,
                               font: Fonts.latoBold_15)
    }
}

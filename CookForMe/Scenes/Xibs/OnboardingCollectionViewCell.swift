//
//  OnboardingCollectionViewCell.swift
//  CookForMe
//
//  Created by Ahir on 20/04/24.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var lblSkip: UILabel!
    @IBOutlet private weak var img: UIImageView!
    @IBOutlet private weak var subTitle: UILabel!
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var btnNext: UIButton!
    @IBOutlet private weak var progressBar: UIProgressView!
    
    static let nibName = UINib(nibName: String(describing: OnboardingCollectionViewCell.self), bundle: nil)
    static let reuseIdentifier = String(describing: OnboardingCollectionViewCell.self)
    
    var onBoardingDelegate: OnBoardingDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
     
    @IBAction func btnSkipClicked(_ sender: UIButton) {
        onBoardingDelegate?.didSkipTap()
    }
    
    private func moveToNextCell(with indexPath: IndexPath) {
        
    }
    
    func config(_ onBoardingPage: OnBoardingModel) {
        lblSkip.setupLabel(CookMeColors.black, text: Texts.skip, font: Fonts.latoRegular_15)
        btnNext.setupButton(backgroundColor: CookMeColors.orangeThemeColor,
                            cornerRadius: btnNext.frame.height / 2)
        progressBar.tintColor = CookMeColors.orangeThemeColor
        img.setupImages(onBoardingPage.img,
                        cornerRadius: img.frame.height / 2)
        title.setupLabel(CookMeColors.black,
                         text: onBoardingPage.title,
                         font: Fonts.latoBold_30)
        subTitle.setupLabel(CookMeColors.black,
                            text: onBoardingPage.subTitle,
                            font: Fonts.latoRegular_18)
    }
}

protocol OnBoardingDelegate {
    func didSkipTap()
}

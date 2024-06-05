//
//  LandingViewController.swift
//  CookForMe
//
//  Created by Ahir on 18/04/24.
//

import UIKit

class LandingViewController: UIViewController {

    @IBOutlet private weak var onBoardingCollectionView: UICollectionView!
    
    var onBoardingPages = [OnBoardingModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupModel()
        setupCollectionview()
    }
    
    private func setupCollectionview() {
        onBoardingCollectionView.register(OnboardingCollectionViewCell.nibName,
                                          forCellWithReuseIdentifier: OnboardingCollectionViewCell.reuseIdentifier)
        onBoardingCollectionView.delegate = self
        onBoardingCollectionView.dataSource = self
    }
    
    private func setupModel() {
        let pages = [
            OnBoardingModel(img: "cook_cake",
                            title: "Welcome To CookIt",
                            subTitle: "Your Personal Recipe Assistant - Find Receips with a simple scan."),
            OnBoardingModel(img: "garlic",
                            title: "AI - Powered Scanning",
                            subTitle: "Effortlessly discover recipes by scanning ingredients or dishes."),
            OnBoardingModel(img: "Veggies",
                            title: "Personalised Delights",
                            subTitle: "Instantly explore recipes tailored to your tastes. Let's get started.")
        ]
        onBoardingPages.append(contentsOf: pages)
    }
    
    private func dequeueOnboardingCell(for indexPath: IndexPath) -> UICollectionViewCell {
        let cell = onBoardingCollectionView.dequeueReusableCell(
            withReuseIdentifier: OnboardingCollectionViewCell.reuseIdentifier, for: indexPath)
        if let cell = cell as? OnboardingCollectionViewCell {
            cell.config(onBoardingPages[indexPath.row])
            cell.onBoardingDelegate = self
            return cell
        }
        return cell
    }
}

extension LandingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onBoardingPages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueOnboardingCell(for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: onBoardingCollectionView.frame.size.width, height: onBoardingCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

// MARK: Collectiview Methods
extension LandingViewController {
    private func moveToNextSlide() {
        if let index = onBoardingCollectionView.indexPathsForVisibleItems.first.flatMap({ IndexPath(item: $0.row + 1, section: $0.section)}) {
            if onBoardingPages.count > index.row {
                onBoardingCollectionView.scrollToItem(at: index, at: .right, animated: true)
            } else {
                redirectToLoginScreen()
            }
        }
    }
    
    private func redirectToLoginScreen() {
        if let ctrl = storyboard?.instantiateViewController(withIdentifier: LoginViewController.storyboardIdentifer) as? LoginViewController {
            navigationController?.pushViewController(ctrl, animated: true)
        }
    }
}

// MARK: OnBoardingDelegate
extension LandingViewController: OnBoardingDelegate {
    func didSkipTap() {
        moveToNextSlide()
    }
}

struct OnBoardingModel {
    let img: String
    let title: String
    let subTitle: String
}

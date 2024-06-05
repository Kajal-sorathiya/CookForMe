//
//  HomeViewController.swift
//  CookForMe
//
//  Created by Ahir on 24/04/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var bgView: UIView!
    
    @IBOutlet private weak var lblHome: UILabel!
    @IBOutlet private weak var profileImg: UIImageView!
    @IBOutlet private weak var lblUserName: UILabel!
    @IBOutlet private weak var lblExplore: UILabel!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var lblCategoryTitle: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var lblTopRecips: UILabel!
    @IBOutlet private weak var tblview: UITableView!
    @IBOutlet private weak var btnRecipe: UIButton!
    @IBOutlet private weak var btnFav: UIButton!
    @IBOutlet private weak var btnScan: UIButton!
    @IBOutlet private weak var imgBurgerMenu: UIImageView!
    @IBOutlet private weak var bgTabView: UIView!
    @IBOutlet private weak var lblRecipe: UILabel!
    @IBOutlet private weak var lblFav: UILabel!
    
    static let storyboardIdentifer = String(describing: HomeViewController.self)
    var categories: [Categories]?
    var topRecipes: [TopRecipeModel]?
    var topRecipeSections = [HomeTopRecipeSection]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction private func btnFavClicked(_ sender: UIButton) {
        redirectToDetailScreen()
    }
    
    private func setupUI() {
        giveShadowToBG()
        setupHeader()
        setupUserName()
        setupSearchBar()
        setupFoodCategories()
        fillupCategories()
        fillupTopRecipes()
        setupTopReceipes()
        setupTabBar()
        prepareHomeTopRecipeSection()
    }
    
    private func giveShadowToBG() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bgView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        bgView.addSubview(blurEffectView)
    }
    
    private func setupHeader() {
        // Home
        lblHome.setupLabel(CookMeColors.white,
                           text: Texts.home,
                           font: Fonts.latoBold_15)
        // Profile Image
        profileImg.setupImages(AppImages.profileImg.name, cornerRadius: profileImg.frame.height / 2)
        // Burger menu
        imgBurgerMenu.setupImages(systemImgName: "text.justify.left")
        imgBurgerMenu.backgroundColor = CookMeColors.clearColor
    }
    
    private func setupUserName() {
        lblUserName.setupLabel(CookMeColors.orangeThemeColor,
                               text: "Hello, Kaajal!",
                               font: Fonts.latoBold_12)
        lblExplore.setupLabel(CookMeColors.white,
                              text: "Explore Tasty Creations",
                              font: Fonts.latoBold_15)
    }
    
    private func setupSearchBar() {
        searchBar.showsBookmarkButton = true
//        searchBar.setImage(UIImage(systemName: "text.line.first.and.arrowtriangle.forward")?.withRenderingMode(.alwaysTemplate), for: .bookmark, state: .normal)
        searchBar.backgroundColor = CookMeColors.clearColor
        searchBar.searchTextField.backgroundColor = CookMeColors.black.withAlphaComponent(1.0)
        searchBar.searchBarStyle = .minimal
        if let leftView = searchBar.searchTextField.leftView as? UIImageView {
            leftView.tintColor = CookMeColors.white
        }
        if let rightView = searchBar.searchTextField.rightView as? UIButton {
            rightView.setImage(UIImage(systemName: "text.line.first.and.arrowtriangle.forward")?.withTintColor(UIColor.white, renderingMode: .alwaysTemplate), for: .normal)
        }
        searchBar.searchTextField.rightView?.tintColor = CookMeColors.orangeThemeColor
    }
    
    private func setupFoodCategories() {
        // Choose Category
        lblCategoryTitle.setupLabel(CookMeColors.white,
                                    text: "Choose Category",
                                    font: Fonts.latoBold_15)
        // Categories
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: CategoriesCollectionViewCell.identifier, bundle: nil),
                                forCellWithReuseIdentifier: CategoriesCollectionViewCell.identifier)
    }
    
    private func setupTopReceipes() {
        // Title
        lblTopRecips.setupLabel(CookMeColors.white,
                                text: "Top Recipies")
        tblview.register(UINib(nibName: TopRecipeTableViewCell.identifier, bundle: nil),
                         forCellReuseIdentifier: TopRecipeTableViewCell.identifier)
        // Recipies
        tblview.delegate = self
        tblview.dataSource = self
    }
    
    private func setupTabBar() {
        btnScan.setupButton(backgroundColor: CookMeColors.orangeThemeColor,
                            cornerRadius: btnScan.frame.height / 2,
                            img: UIImage(systemName: "barcode.viewfinder"))
        btnFav.setupButton(backgroundColor: CookMeColors.clearColor,
                           img: UIImage(systemName: "heart"))
        btnRecipe.setupButton(img: UIImage(systemName: "snowflake"), tintColor: CookMeColors.orangeThemeColor)
        bgTabView.setUpView(bgColor: CookMeColors.black, roundCorners: [.topLeft, .topRight])
        bgTabView.clipsToBounds = true
        lblFav.setupLabel(CookMeColors.white, text: "Saved")
        lblRecipe.setupLabel(CookMeColors.orangeThemeColor, text: "Recipe")
    }
    
    private func prepareHomeTopRecipeSection() {
        topRecipeSections = [.dish, .emptySpace]
    }
    
    private func fillupTopRecipes() {
        let topReceipes = [
            TopRecipeModel(recipeImg: "category1",
                           recipeTitle: "Grill Roti",
                           timeToReady: "20:00 min",
                           desc: "This is a traditional recipe in our town. LEt's tried out and have the taste of amazing Kutch!",
                           rating: "4.5",
                           recipeLevel: "Easy",
                           isFav: true),
            TopRecipeModel(recipeImg: "category1",
                           recipeTitle: "Grill Sandwich",
                           timeToReady: "05:00 min",
                           desc: "This is a traditional recipe in our town. Let's tried out and have the taste of amazing Kutch!",
                           rating: "5.0",
                           recipeLevel: "Medium",
                           isFav: true),
            TopRecipeModel(recipeImg: "category1",
                           recipeTitle: "Grill Roti",
                           timeToReady: "20:00 min",
                           desc: "This is a traditional recipe in our town. LEt's tried out and have the taste of amazing Kutch!",
                           rating: "4.7",
                           recipeLevel: "Hard",
                           isFav: false)
        ]
        self.topRecipes = topReceipes
    }
    
    private func fillupCategories() {
        let categories = [
            Categories(title: "Indian", img: "category1"),
            Categories(title: "Italian", img: "category1"),
            Categories(title: "Salads", img: "category1"),
            Categories(title: "Chience", img: "category1"),
            Categories(title: "Punjabi", img: "category1"),
            Categories(title: "Indian", img: "category1")
        ]
        self.categories = categories
    }
    
    private func redirectToDetailScreen() {
        let ctrl = storyboard?.instantiateViewController(withIdentifier: "RecipeDetailViewController")
        if let ctrl = ctrl as? RecipeDetailViewController {
            navigationController?.pushViewController(ctrl, animated: true)
        }
    }
    
    private func dequeueCategoriesCell(with indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.identifier, for: indexPath)
        if let cell = cell as? CategoriesCollectionViewCell {
            if let categories {
                cell.config(with: categories[indexPath.row])
            }
            return cell
        }
        return cell
    }
    
    private func dequeueTopRecipesCell(with indexPath: IndexPath) -> UITableViewCell {
        let cell = tblview.dequeueReusableCell(withIdentifier: TopRecipeTableViewCell.identifier, for: indexPath)
        if let cell = cell as? TopRecipeTableViewCell {
            if let topRecipes {
                cell.config(with: topRecipes[indexPath.row])
            }
            return cell
        }
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return dequeueCategoriesCell(with: indexPath)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.size.width / 4, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        topRecipeSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if topRecipeSections[section] == .dish {
            return topRecipes?.count ?? 0
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if topRecipeSections[indexPath.section] == .dish {
            return dequeueTopRecipesCell(with: indexPath)
        }
        let cell = UITableViewCell()
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if topRecipeSections[indexPath.section] == .emptySpace {
            return 100
        }
        return UITableView.automaticDimension
    }
}

enum HomeTopRecipeSection {
    case dish
    case emptySpace
}

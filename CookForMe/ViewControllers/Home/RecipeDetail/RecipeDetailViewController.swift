//
//  RecipeDetailViewController.swift
//  CookForMe
//
//  Created by Ahir on 30/05/24.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet private weak var bgView: UIView!
    @IBOutlet private var supportView: [UIView]!
    @IBOutlet private weak var btnBack: UIButton!
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var imgRightTabbar: UIImageView!
    @IBOutlet private weak var tblview: UITableView!
    @IBOutlet private weak var bottomView: UIView!
    @IBOutlet private weak var imgRecipe: UIImageView!
    
    // MARK: Variables
    var recipeDetailVM = RecipeDetailViewModel()
    
    // MARK: Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    // MARK: IBAction
    
    // MARK: Initial methods
    private func initialSetup() {
        giveShadowToBG()
        setupNavBar()
        prepareSections()
        setupTableView()
        setupBottomView()
        setupRecipeImg()
    }
    
    private func giveShadowToBG() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bgView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        bgView.addSubview(blurEffectView)
        supportView.forEach { myView in
            myView.backgroundColor = CookMeColors.clearColor
        }
    }
    
    private func setupNavBar() {
        // Back Button
        btnBack.setupButton(img: UIImage(systemName: "chevron.left"), tintColor: CookMeColors.white)
        // Title Label
        lblTitle.setupLabel(CookMeColors.white, text: "DhalDhokdi Gujarat")
        // Right bar img
        imgRightTabbar.setupImages(systemImgName: "square.and.arrow.up", tintColor: CookMeColors.white)
    }
    
    private func setupRecipeImg() {
        imgRecipe.clipsToBounds = true
        imgRecipe.setupImages("category1", cornerRadius: imgRecipe.frame.size.height / 2)
    }
    
    private func setupBottomView() {
        bottomView.setUpView(bgColor: CookMeColors.black, roundCorners: [.topRight, .topLeft], radius: 20)
    }
    
    private func prepareSections() {
        recipeDetailVM.prepareSections()
        recipeDetailVM.fillUpRecipeDetails()
    }
    
    private func setupTableView() {
        tblview.delegate = self
        tblview.dataSource = self
        tblview.backgroundColor = CookMeColors.clearColor
        tblview.registerCell(with: TitleCell.self)
        tblview.registerCell(with: DescriptionCell.self)
        tblview.registerCell(with: TableTitlesCell.self)
        tblview.registerCell(with: RecipesCell.self)
        tblview.registerCell(with: CookNowCell.self)
    }
    
    private func dequeueTitleCell(with indexPath: IndexPath) -> UITableViewCell {
        let cell = tblview.dequeueReusableCell(withIdentifier: TitleCell.identifier, for: indexPath)
        if let cell = cell as? TitleCell {
            cell.config(with: recipeDetailVM.recipeDetail)
            return cell
        }
        return cell
    }
    
    private func dequeueDescCell(with indexPath: IndexPath) -> UITableViewCell {
        let cell = tblview.dequeueReusableCell(withIdentifier: DescriptionCell.identifier, for: indexPath)
        if let cell = cell as? DescriptionCell {
            cell.config(with: recipeDetailVM.recipeDetail?.description ?? "")
            return cell
        }
        return cell
    }
    
    private func dequeueTableTitleCell(with indexPath: IndexPath) -> UITableViewCell {
        let cell = tblview.dequeueReusableCell(withIdentifier: TableTitlesCell.identifier, for: indexPath)
        if let cell = cell as? TableTitlesCell {
            cell.config(with: recipeDetailVM.recipeDetail)
            return cell
        }
        return cell
    }
    
    private func dequeueRecipesCell(with indexPath: IndexPath) -> UITableViewCell {
        let cell = tblview.dequeueReusableCell(withIdentifier: RecipesCell.identifier, for: indexPath)
        if let cell = cell as? RecipesCell {
            cell.config(with: recipeDetailVM.recipeDetail?.recipes[indexPath.row])
            return cell
        }
        return cell
    }
    
    private func dequeueCookNowCell(with indexPath: IndexPath) -> UITableViewCell {
        let cell = tblview.dequeueReusableCell(withIdentifier: CookNowCell.identifier, for: indexPath)
        if let cell = cell as? CookNowCell {
            cell.config(with: "Cook Now")
            return cell
        }
        return cell
    }
}

extension RecipeDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        recipeDetailVM.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch recipeDetailVM.sections[section] {
        case .recipes :
            return recipeDetailVM.recipeDetail?.recipes.count ?? 0
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch recipeDetailVM.sections[indexPath.section] {
        case .emptySpace:
            let cell = UITableViewCell()
            cell.backgroundColor = CookMeColors.clearColor
            return cell
        case .title:
            let cell = dequeueTitleCell(with: indexPath)
            return cell
        case .recipeDescription:
            return dequeueDescCell(with: indexPath)
        case .tableTitles:
            return dequeueTableTitleCell(with: indexPath)
        case .recipes:
            return dequeueRecipesCell(with: indexPath)
        case .cookNow:
            return dequeueCookNowCell(with: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch recipeDetailVM.sections[indexPath.section] {
        case .emptySpace:
            return 30
        default:
            return UITableView.automaticDimension
        }
    }
}

enum RecipeDetailSections {
    case emptySpace
    case title
    case recipeDescription
    case tableTitles
    case recipes
    case cookNow
}

struct RecipeDetail {
    let recipeTitle: String
    let recipeMakeTime: String
    let recipeLevel: String
    let description: String
    let ingredientsTitle: String
    let descriptionTitle: String
    let reviewTitle: String
    let recipes: [recipes]
}

struct recipes {
    let img: String
    let name: String
    let weight: String
}

extension UITableView {
    func registerCell(with cell: UITableViewCell.Type) {
        self.register(UINib(nibName: cell.identifier, bundle: nil), forCellReuseIdentifier: cell.identifier)
    }
}

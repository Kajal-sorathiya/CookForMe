//
//  RecipeDetailViewModel.swift
//  CookForMe
//
//  Created by Ahir on 01/06/24.
//

import Foundation

class RecipeDetailViewModel {
    var sections = [RecipeDetailSections]()
    var recipeDetail: RecipeDetail?
    
    func prepareSections() {
        sections = [.emptySpace, .title, .recipeDescription, .tableTitles, .recipes, .cookNow]
    }
    
    func fillUpRecipeDetails() {
        self.recipeDetail = RecipeDetail(recipeTitle: "DalDhokdi Gujarat",
                                         recipeMakeTime: "20-30 mins",
                                         recipeLevel: "easy",
                                         description: "Savour juicy and flavoured perfection of grilled DalDhokli, seasoned with garlic, onion powder, smoked paprika, and a zesty lime finish.",
                                         ingredientsTitle: "Ingredients",
                                         descriptionTitle: "Description",
                                         reviewTitle: "Review",
                                         recipes: [
                                            recipes(img: "category1", name: "DalDhokli", weight: "1kg"),
                                            recipes(img: "category1", name: "Khandvi", weight: "3/4 spoon"),
                                            recipes(img: "category1", name: "Garlic Powder", weight: "1/2 spoon")
                                         ]
        )
    }
}

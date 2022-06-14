//
//  IngredientDetailsViewModel.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 08/06/2022.
//

import Foundation

@MainActor
class IngredientDetailsViewModel: ObservableObject {

    var getIngredientDetailsUseCase = GetIngredientDetailsUseCase(repository: IngredientDetailsRepositoryImpl(dataSource: IngredientDetailsAPIImpl()))

    @Published var ingredientDetails: IngredientDetails = IngredientDetails(id: "", name: "", description: "", alcohol: "")
    @Published var errorMessage = ""
    @Published var hasError = false

    func getIngredientDetails(ingredient: SingleIngredient) async {
        errorMessage = ""
        let result = await getIngredientDetailsUseCase.execute(ingredient: ingredient)
        switch result {
        case .success(let ingredientDetails):
            self.ingredientDetails = ingredientDetails
        case .failure(let error):
            self.ingredientDetails = IngredientDetails(id: "Unknown Data", name: "Unknown Data", description: "Unknown Data", alcohol: "Unknown Data")
            errorMessage = error.localizedDescription
            hasError = true
        }
    }
}

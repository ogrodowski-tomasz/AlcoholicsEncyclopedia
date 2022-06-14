//
//  IngredientListViewModel.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 07/06/2022.
//

import Combine
import Foundation
import AsyncAlgorithms

@MainActor
class IngredientsListViewModel: ObservableObject {

    var getIngredientsListUseCase = GetIngredientsUseCase(repository: IngredientsListRepositoryImpl(dataSource: IngredientsContainerAPIImpl()))

    @Published var ingredients: [SingleIngredient] = []
    @Published var errorMessage = ""
    @Published var hasError = false
    @Published var filterName: String = ""

    func getIngredients() async {
        errorMessage = ""
        let result = await getIngredientsListUseCase.execute()
        switch result {
        case .success(let ingredientsContainer):
            self.ingredients = ingredientsContainer.ingredientsContainer
            // Subscribing to changes in filterName property.
            for await value in $filterName.values {
                self.ingredients = await filterContainer(text: value, container: ingredientsContainer.ingredientsContainer)
            }
        case .failure(let error):
            self.ingredients = []
            errorMessage = error.localizedDescription
            hasError = true
        }
    }

    func filterContainer(text: String, container: [SingleIngredient]) async -> [SingleIngredient] {

        guard !text.isEmpty else { return container }
        let lowercasedText = text.lowercased()
        return container.filter{ $0.name.lowercased().contains(lowercasedText) }
    }
}

/*
 Task {
     for await value in $filterName.values {
         self.ingredients.filter { value.isEmpty || $0.name.lowercased().contains(value.lowercased()) }
     }
 }
 */

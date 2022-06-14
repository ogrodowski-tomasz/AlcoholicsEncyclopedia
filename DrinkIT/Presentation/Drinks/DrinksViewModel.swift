//
//  DrinksViewModel.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 13/06/2022.
//

import Foundation

@MainActor
class DrinksViewModel: ObservableObject {
    var getDrinksUseCase = GetDrinksUseCase(repository: DrinksListRepositoryImpl(dataSource: DrinksContainerAPIImpl()))

    @Published var drinks: DrinksContainer = DrinksContainer(drinksContainer: [])
    @Published var errorMessage = ""
    @Published var hasError = false

    func getDrinks(for ingredient: SingleIngredient) async {
        errorMessage = ""
        let result = await getDrinksUseCase.execute(for: ingredient)
        switch result {
        case .success(let drinksContainer):
            self.drinks = drinksContainer
        case .failure(let error):
            self.drinks = DrinksContainer(drinksContainer: [])
            errorMessage = error.localizedDescription
            hasError = true
        }
    }
}

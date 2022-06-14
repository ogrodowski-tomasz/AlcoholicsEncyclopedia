//
//  DrinkDetailsViewModel.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 14/06/2022.
//

import Foundation

@MainActor
class DrinkDetailsViewModel: ObservableObject {
    var getDrinkDetailsUseCase = GetDrinkDetailsUseCase(repository: DrinkDetailsRepositoryImpl(dataSource: DrinkDetailsAPIImpl()))

    @Published var drinkDetails: DrinkDetails = DrinkDetails(id: "", name: "", category: "", alcoholic: "", glass: "", instructions: "", imageImage: "", ingredients: [], measurments: [])
    @Published var errorMessage = ""
    @Published var hasError = false

    func getDrinkDetails(drinkID: String) async {
        errorMessage = ""
        let result = await getDrinkDetailsUseCase.execute(drinkID: drinkID)
        switch result {
        case .success(let drinkDetails):
            self.drinkDetails = drinkDetails
        case .failure(let error):
            self.drinkDetails = DrinkDetails(id: "", name: "", category: "", alcoholic: "", glass: "", instructions: "", imageImage: "", ingredients: [], measurments: [])
            errorMessage = error.localizedDescription
            hasError = true
        }
    }
}

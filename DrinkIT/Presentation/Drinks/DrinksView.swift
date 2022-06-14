//
//  DrinksView.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 13/06/2022.
//

import SwiftUI

struct DrinksView: View {


    @StateObject var vm = DrinksViewModel()
    let ingredient: SingleIngredient

    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    @State private var showDetailView = false
    @State private var selectedDrink: SingleDrink?

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(vm.drinks.drinksContainer, id: \.name) { drink in
                    DrinkCard(drink: drink) {
                        self.selectedDrink = drink
                        self.showDetailView = true
                    }
                }
            }
            .background {
                NavigationLink(isActive: $showDetailView) {
                    if let selectedDrink = selectedDrink {
                        DrinkDetailsView(drink: selectedDrink)
                    }
                } label: {
                    Text("")
                }
            }
        }
        .task {
            await vm.getDrinks(for: ingredient)
        }
    }
}

struct DrinksView_Previews: PreviewProvider {
    static var previews: some View {
        DrinksView(ingredient: SingleIngredient(name: "Vodka"))
    }
}

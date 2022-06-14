//
//  IngredientListView.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 07/06/2022.
//

import SwiftUI

typealias SingleIngredient = IngredientsContainer.Ingredient

struct IngredientListView: View {

    @StateObject var vm = IngredientsListViewModel()

    @State private var showDetailView = false
    @State private var selectedIngredient: SingleIngredient?

    var body: some View {
        ZStack(alignment: .top) {
            BackgroundView()
            VStack(alignment: .leading, spacing: 15) {
                Spacer(minLength: 50)
                InputTextFieldView(text: $vm.filterName, placeholder: "Search for ingredient", keyboardType: .default, sfSymbol: "testtube.2")
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(vm.ingredients, id: \.self) { ingredient in
                            ImageBlockView(imageURL: ingredient.imageURL, name: ingredient.name) {
                                selectedIngredient = ingredient
                                showDetailView = true
                            }
                        }
                    }
                }
                .background {
                    NavigationLink(destination: IngredientDetailsView(ingredient: $selectedIngredient), isActive: $showDetailView, label: { EmptyView() })
                }
                Spacer(minLength: 150)

            }
            .padding(.horizontal,15)
            .navigationTitle("Drink It!")
            .task {
                await vm.getIngredients()
            }
            .alert("Error", isPresented: $vm.hasError) {
            } message: {
                Text(vm.errorMessage)
            }
        }
    }

//    fileprivate func IngredientList() -> some View {
//
//    }
}

struct IngredientListView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientListView()
    }
}

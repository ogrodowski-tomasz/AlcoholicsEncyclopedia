//
//  IngredientsDetailsView.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 08/06/2022.
//

import SwiftUI

struct IngredientDetailsView: View {

    @StateObject var vm = IngredientDetailsViewModel()
    @Binding var ingredient: SingleIngredient?
    @State private var showFullDescription = false



    var body: some View {
        if let ingredient = ingredient {
            ZStack {
                BackgroundView()
                VStack(spacing: 10) {
                    ingredientLabel(ingredient: ingredient)
                    ingredientDescription()
                    DrinksView(ingredient: ingredient)
                    Spacer()
                }
                .padding(.horizontal)
            }
            .task {
                await vm.getIngredientDetails(ingredient: ingredient)
            }
            .navigationTitle(ingredient.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private func alcoholColor() -> Color {
        if vm.ingredientDetails.isAlcoholic {
            return Color.red
        } else {
            return Color.green
        }
    }

    private func ingredientLabel(ingredient: SingleIngredient) -> some View {
        HStack(alignment: .top) {
            ImageView(url: ingredient.imageURL, name: ingredient.name, contentRatio: .fit)
                .frame(width: UIScreen.main.bounds.width / 2)
                .padding(3)
                .roundedRectangleBackground(color: alcoholColor(), cornerRadius: 10)
            VStack(alignment: .leading, spacing: 10) {
                Text("Name:")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(vm.ingredientDetails.name)
                    .font(.title2)
                    .fontWeight(.semibold)

                Text("Alcoholic")
                    .font(.caption)
                    .foregroundColor(.secondary)
                HStack {
                    Text(vm.ingredientDetails.isAlcoholic ? "🔞" : "❎")
                    Text(vm.ingredientDetails.alcohol)
                        .font(.title2)
                        .fontWeight(.semibold)
                }

                .foregroundColor(alcoholColor())

            }
            Spacer()
        }

    }

    private func ingredientDescription() -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Description")
                .font(.callout)
                .foregroundColor(.secondary)
            Text(vm.ingredientDetails.unwrappedDescrption)
                .font(.footnote)
                .lineLimit(showFullDescription ? nil : 4)

        }
        .padding(5)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 1)
                .foregroundColor(alcoholColor())
        }
        .onTapGesture {
            withAnimation {
                showFullDescription.toggle()
            }
        }
    }
}

struct IngredientsDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientDetailsView(ingredient: .constant(SingleIngredient(name: "vodka")))
//        IngredientDetailsView(ingredient: .constant(SingleIngredient(name: "tea")))

    }
}

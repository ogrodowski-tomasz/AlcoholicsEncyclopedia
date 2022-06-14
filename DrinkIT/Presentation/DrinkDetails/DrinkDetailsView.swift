//
//  DrinkDetailsView.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 14/06/2022.
//

import SwiftUI

struct DrinkDetailsView: View {

    @StateObject var vm = DrinkDetailsViewModel()
    let drink: SingleDrink

    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                ImageView(url: drink.imageURL, name: drink.name, contentRatio: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    .padding(.top, 10)
                VStack(alignment: .leading, spacing: 10) {
                    Text(vm.drinkDetails.name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.bottom, 10)
                    Text("To create, you have to prepare:")
                        .font(.callout)
                        .foregroundColor(.secondary)
                    HStack {
                        Text("Glass: ")
                        Text(vm.drinkDetails.glass)
                            .fontWeight(.semibold)
                    }
                    Text("Ingredients:")
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(vm.drinkDetails.measurments.indices, id: \.self) { index in
                                VStack(alignment: .leading) {
                                    Text(vm.drinkDetails.ingredients[index])
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                    Text(vm.drinkDetails.measurments[index])
                                        .font(.caption)
                                }
                                .padding()
                                .background {
                                    Capsule()
                                        .strokeBorder(lineWidth: 2, antialiased: true)
                                }
                            }
                        }
                    }
                    .frame(maxHeight: 70)

                    Text("Drink description")
                        .font(.callout)
                        .foregroundColor(.secondary)
                    Text(vm.drinkDetails.instructions)
                    Spacer()
                }
            }
            .padding(.horizontal)
            .background(.ultraThinMaterial)
        }
        .task {
            await vm.getDrinkDetails(drinkID: drink.id)
        }
    }
}

struct DrinkDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let drink = SingleDrink(
            name: "155 Belmont",
            imageURL: URL(string: "https://www.thecocktaildb.com/images/media/drink/yqvvqs1475667388.jpg")!,
            id: "15346")
        NavigationView {
            DrinkDetailsView(
                drink: drink
            )
            .navigationTitle(drink.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

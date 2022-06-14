//
//  DrinkCard.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 13/06/2022.
//

import SwiftUI

struct DrinkCard: View {
    let drink: SingleDrink
    let completion: () -> Void

    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    let singleCardHeight = UIScreen.main.bounds.height / 5

    var body: some View {
        Button(action: completion) {
            VStack {
                ImageView(url: drink.imageURL, name: drink.name, contentRatio: .fit)

                Text(drink.name)
                    .fontWeight(.regular)
                    .frame(minHeight: singleCardHeight / 3)
                    .padding()

            }
            .foregroundColor(.primary)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .background {
                RoundedRectangle(cornerRadius: 10).strokeBorder()
            }
            .frame(minHeight: singleCardHeight)
            .padding([.horizontal, .bottom], 5)
        }
    }
}

struct DrinkCard_Previews: PreviewProvider {
    static var previews: some View {
        let drink1 = SingleDrink(name: "Acapulco", imageURL: URL(string: "https://www.thecocktaildb.com/images/media/drink/il9e0r1582478841.jpg")!, id: "17836")
        let drink2 = SingleDrink(name: "3-Mile Long Island Iced Tea", imageURL: URL(string: "https://www.thecocktaildb.com/images/media/drink/rrtssw1472668972.jpg")!, id: "15300")
        let cardWidth: CGFloat = 170
            HStack {
                DrinkCard(drink: drink1, completion: {})
                    .previewLayout(.sizeThatFits)
                    .frame(width: cardWidth)
                DrinkCard(drink: drink2, completion: {})
                    .previewLayout(.sizeThatFits)
                    .frame(width: cardWidth)
            }
    }
}

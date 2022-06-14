//
//  IngredientBlockView.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 10/06/2022.
//

import SwiftUI

struct ImageBlockView: View {

    let imageURL: URL
    let name: String
    var completion: () -> Void

    var body: some View {
        Button(action: completion, label: {
            VStack {
                ImageView(url: imageURL, name: name, contentRatio: .fit)
                    .padding(.bottom, 5)
                Text(name)
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)

            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.red)
            }
            .frame(width: UIScreen.main.bounds.width / 1.8)
            .shadow(radius: 2.5)
        })
        .padding(.horizontal, 6)
    }
}

struct IngredientBlockView_Previews: PreviewProvider {
    static var previews: some View {
        let name = "Vodka"
        let url = Endpoint.url(for: .image, inquiry: name)
        ImageBlockView(imageURL: url, name: "Vodka", completion: {})
    }
}

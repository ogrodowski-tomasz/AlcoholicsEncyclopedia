//
//  ImageView.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 10/06/2022.
//

import SwiftUI

struct ImageView: View {
    @StateObject var vm = ImageViewModel()
    var url: URL
    var name: String
    var ratio: ImageRatio

    enum ImageRatio {
        case fit, fill
    }
    
    init(url: URL, name: String, contentRatio: ImageRatio) {
        self.url = url
        self.name = name
        self.ratio = contentRatio
    }

    var body: some View {
        VStack {
            Image(uiImage: vm.image)
                .resizable()
                .aspectRatio(contentMode: ratio == .fit ? .fit : .fill)
        }
        .task {
            await vm.getImage(url: url, forName: name)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        let url = URL(string: "https://www.thecocktaildb.com/images/media/drink/rrtssw1472668972.jpg")!
        ImageView(url: url, name: "drink1", contentRatio: .fit)
    }
}

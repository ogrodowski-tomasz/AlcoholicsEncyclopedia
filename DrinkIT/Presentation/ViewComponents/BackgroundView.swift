//
//  WaterShape.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 10/06/2022.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            WaterShape()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.cyan.opacity(0.5), Color.cyan, Color.blue]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                )
                //.frame(width: 200, height: 200)
                .background {
                    LinearGradient(
                        gradient: Gradient(colors:
                                            [
                                                Color.white.opacity(0.5),
                                                Color.yellow.opacity(0.6),
                                                Color.yellow,
                                                Color.yellow
                                            ]
                                          ),
                        startPoint: .top,
                        endPoint: .bottom)
                }
                .ignoresSafeArea()
        }
    }
}


struct WaterShape_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}

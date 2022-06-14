//
//  RoundedRectangleBackground.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 13/06/2022.
//

import SwiftUI

struct RoundedRectangleBackground: ViewModifier {

    let color: Color
    let cornerRadius: CGFloat

    func body(content: Content) -> some View {
        content
            .background {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(color)
            }
    }
}

extension View {
    func roundedRectangleBackground(color: Color, cornerRadius: CGFloat) -> some View {
        self.modifier(RoundedRectangleBackground(color: color, cornerRadius: cornerRadius))
    }
}

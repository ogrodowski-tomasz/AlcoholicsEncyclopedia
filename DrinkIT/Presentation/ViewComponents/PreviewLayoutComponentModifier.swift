//
//  PreviewLayoutComponentModifier.swift
//  UserManagment
//
//  Created by Tomasz Ogrodowski on 31/05/2022.
//

import SwiftUI

struct PreviewLayoutComponentModifier: ViewModifier {
    let name: String
    func body(content: Content) -> some View {
        content
            .previewLayout(.sizeThatFits)
            .previewDisplayName(name)
            .padding()
    }
}

extension View {
    func preview(with name: String) -> some View {
        self.modifier(PreviewLayoutComponentModifier(name: name))
    }
}



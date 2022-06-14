//
//  WaterShape.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 10/06/2022.
//

import SwiftUI

struct WaterShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.midY * 5/3))
            path.addQuadCurve(
                to: CGPoint(x: rect.midX, y: rect.midY * 5/3),
                control: CGPoint(x: rect.width * 0.25, y: rect.height * 0.76))
            path.addQuadCurve(
                to: CGPoint(x: rect.maxX, y: rect.midY * 5/3),
                control: CGPoint(x: rect.width * 0.75, y: rect.height * 0.90))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))

        }
    }
}

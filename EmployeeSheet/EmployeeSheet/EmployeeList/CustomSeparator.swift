//
//  CustomSeparator.swift
//  EmployeeSheet
//
//  Created by Ali Raza Amjad on 27/01/2025.
//

import SwiftUI

struct CustomSeparator: View {
    
    var color: Color = .gray
    var lineWidth: CGFloat = 2
    var dashLength: CGFloat = 8
    var dashSpacing: CGFloat = 4
    var padding: CGFloat = 10
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = geometry.size.width
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: width, y: 0))
            }
            .stroke(style: StrokeStyle(lineWidth: lineWidth, dash: [dashLength, dashSpacing]))
            .foregroundColor(color)
        }
        .frame(height: lineWidth)
        .padding(.horizontal, padding)
    }
}

#Preview {
    CustomSeparator()
}

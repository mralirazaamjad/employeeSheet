//
//  ButtonTextWithBorder.swift
//  EmployeeSheet
//
//  Created by Ali Raza Amjad on 28/01/2025.
//

import SwiftUI

// Button Text View
struct ButtonTextWithBorder: View {
    var text = "button"
    var horizontalPadding: CGFloat = 20.0
    var verticalPadding: CGFloat = 6.0
    var textColor: Color = .black
    var cornerRadius: CGFloat = 8
    var borderColor: Color = .black
    var bgColor: Color = .gray
    
    var body: some View {
        Text(text)
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .foregroundColor(textColor)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(borderColor, lineWidth: 1)
                    .fill(bgColor)
            )
    }
}

#Preview {
    ButtonTextWithBorder()
}

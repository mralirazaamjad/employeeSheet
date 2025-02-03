//
//  CircularLoader.swift
//  EmployeeSheet
//
//  Created by Ali Raza Amjad on 03/02/2025.
//

import SwiftUI

struct CircularLoader: View {
    var body: some View {
        ZStack {
            LoaderView(progress: 0.8)
                .frame(width: 100, height: 100)
        }
        .containerRelativeFrame([.horizontal, .vertical])
        .background(.black.opacity(0.3))
    }
}

#Preview {
    CircularLoader()
}

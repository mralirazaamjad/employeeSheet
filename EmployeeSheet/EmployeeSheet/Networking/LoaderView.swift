//
//  LoaderView.swift
//  EmployeeSheet
//
//  Created by Ali Raza Amjad on 03/02/2025.
//

import SwiftUI

struct LoaderView: View {
    
    @State private var color = Color.yellow
    @State var progress: Double = 0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State private var rotation: Double = 0
    
    var body: some View {
//        ZStack {
            Circle()
                .stroke(
                    color.opacity(0.3),
                    lineWidth: 10
                )
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    color,
                    style: StrokeStyle(
                        lineWidth: 10,
                        lineCap: .round
                    )
                    
                )
                .rotationEffect(.degrees(rotation))
                .animation(.easeOut, value: rotation)
                .onReceive(timer) { _ in
                    rotation += 45
                }
//        }
    }
}

#Preview {
    LoaderView(progress: 0.8)
}

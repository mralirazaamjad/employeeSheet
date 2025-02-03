//
//  ContentView.swift
//  EmployeeSheet
//
//  Created by Ali Raza Amjad on 27/01/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var pushNewView: Bool = false
    @State private var progress: Double = 0.0
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Employee Sheet")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                ProgressView(value: progress, total: 5.0)
                    .progressViewStyle(LinearProgressViewStyle())
                    .scaleEffect(x: 1, y: 2, anchor: .center) // Change height of progress bar
                    .padding()
                    .frame(height: 10) // Adjust height
                    .padding(.horizontal, 20)
                    .accentColor(.yellow)
                    .onReceive(timer) { _ in
                        if progress < 5.0 {
                            progress += 0.01
                        } else {
                            pushNewView = true
                            timer.upstream.connect().cancel()
                        }
                    }
            }
            .containerRelativeFrame([.horizontal, .vertical])
            .background(Color(.cyan))
            .navigationDestination(isPresented: $pushNewView) {
                EmployeeList()
                    .transition(.identity)
            }
        }
    }
}

#Preview {
    ContentView()
}

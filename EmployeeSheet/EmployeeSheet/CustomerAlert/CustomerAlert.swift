//
//  CustomerAlert.swift
//  EmployeeSheet
//
//  Created by Ali Raza Amjad on 28/01/2025.
//

import SwiftUI

struct CustomerAlert: View {
    
    var didDismiss: ((Bool) -> ())?
    
    var body: some View {
//        ZStack {
//        }
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Are you sure you want to delete this employee data?")
                        .font(.system(size: 18))
                        .fontWeight(.medium)
                    
                    Text("If you will this data it will never ever come back.")
                        .font(.system(size: 18))
                        .fontWeight(.medium)
                }
            }
            
            VStack {
                HStack(spacing: 30) {
                    Button(action: {
                        print("Cancel button clicked")
                        didDismiss?(false)
                    }, label: {
                        
                        ButtonTextWithBorder(text: "Cancel", textColor: .black, bgColor: .white)
                            .fontWeight(.bold)
                        
                    })
                    
                    Button(action: {
                        print("Delete button clicked")
                        didDismiss?(true)
                    }, label: {
                        ButtonTextWithBorder(text: "Delete", textColor: .white, borderColor: .clear, bgColor: .red)
                            .fontWeight(.bold)
                    })
                }
            }
            .padding(.top)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(.gray, lineWidth: 1)
                .fill(.white)
        )
        .containerRelativeFrame([.horizontal, .vertical])
        .background(.black.opacity(0.3))
    }
}

#Preview {
    CustomerAlert()
}

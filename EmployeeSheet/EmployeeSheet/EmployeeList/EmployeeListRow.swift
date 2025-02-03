//
//  EmployeeListRow.swift
//  EmployeeSheet
//
//  Created by Ali Raza Amjad on 27/01/2025.
//

import SwiftUI
import Kingfisher

struct EmployeeListRow: View {
    
    var didSelectRow: (()-> Void)?
    var objEmployee: EmployeeResponse?
    
    var body: some View {
        VStack(spacing: 16) {
            CustomSeparator(color: .clear, lineWidth: 1, dashLength: 6, dashSpacing: 0, padding: 0)
            HStack {
                
                KFImage(URL(string: "https://fastly.picsum.photos/id/42/3456/2304.jpg?hmac=dhQvd1Qp19zg26MEwYMnfz34eLnGv8meGk_lFNAJR3g")!)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 60, height: 60)
                    .overlay(Circle().stroke(Color.white))
                    .shadow(color: .white, radius: 10)
                VStack {
                    HStack {
                        Text("ID:")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                        Text("\(objEmployee?.id ?? 0)")
                            .font(.system(size: 14))
                        Spacer()
                    }
                    HStack {
                        Text("Title:")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                        Text(objEmployee?.title ?? "--")
                            .font(.system(size: 14))
                            .lineLimit(1)
                        Spacer()
                    }
                    HStack {
                        Text("Description:")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                        Text(objEmployee?.body ?? "--")
                            .font(.system(size: 14))
                            .lineLimit(1)
                        Spacer()
                    }
                }
                .foregroundColor(.white)
                
                Image(systemName: "trash.circle")
                    .resizable()
                    .foregroundColor(.yellow)
                    .frame(width: 30, height: 30)
                    .onTapGesture {
                        didSelectRow?()
                    }
                
                Spacer()
            }
            .padding(.horizontal, 16)
            CustomSeparator(color: .white, lineWidth: 1, dashLength: 6, dashSpacing: 0, padding: 16)
        }
        .background(Color.cyan)
        .padding(.vertical, -14)
    }
}

#Preview {
    EmployeeListRow()
}


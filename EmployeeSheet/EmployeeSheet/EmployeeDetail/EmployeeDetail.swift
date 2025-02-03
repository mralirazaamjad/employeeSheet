//
//  EmployeeDetail.swift
//  EmployeeSheet
//
//  Created by Ali Raza Amjad on 27/01/2025.
//

import SwiftUI
import Kingfisher

struct EmployeeDetail: View {
    
    @Environment(\.dismiss) var dismiss
    var objEmployee: EmployeeResponse?
    
    var body: some View {
        VStack(spacing: 16) {
            KFImage(URL(string: "https://fastly.picsum.photos/id/56/2880/1920.jpg?hmac=BIplhYgNZ9bsjPXYhD0xx6M1yPgmg4HtthKkCeJp6Fk")!)
                .resizable()
                .frame(height: 250)
            
            VStack(spacing: 20) {
                HStack() {
                    Text("Title:")
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                    Text(objEmployee?.title ?? "hkhjkj")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                    Spacer()
                }
                
                HStack(alignment: .top) {
                    Text("Body:")
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                        .foregroundColor(.white)

                    Text(objEmployee?.body ?? "adsfkjhl sdafhsadklhf sdklahfljksdahfkjlsadhjkfsad fhds jkalhadfjks fhsdaklhfsdal fhdsalkfh sadklfhasdjklhfsadklhf sadlhfkajsldhf salhfhsa klfsdah fsdalhfjasdkh ksdjaflhjksdahf klsdhafjks")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            .padding(.horizontal, 16)
            Spacer()
        }
        .background(Color.cyan)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("My Detail")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }, label: {
                    HStack {
                        Image("back_arrow")
                    }
                })
            }
        }
    }
}

#Preview {
    EmployeeDetail()
}

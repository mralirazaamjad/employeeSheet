//
//  EmployeeDetail.swift
//  EmployeeSheet
//
//  Created by Ali Raza Amjad on 27/01/2025.
//

import SwiftUI

struct EmployeeList: View {
    @State private var showAlert = false
    @State private var arrayEmployee = [EmployeeResponse]()
    @State private var deleteIndex = -1
    @State private var isLoading = false
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                                        
                    ForEach(Array(arrayEmployee.enumerated()), id: \.offset) { index, data in
                        EmployeeListRow(didSelectRow: {
                            showAlert = true
                            deleteIndex = index
                        }, objEmployee: data)
                        .background(NavigationLink("", destination: EmployeeDetail(objEmployee: data)))
                    }
                    .listRowSeparator(.hidden, edges: .all)
                    
                }
                .listStyle(.plain)
                .navigationBarTitleDisplayMode(.inline)
                .padding(.horizontal, -20)
                .background(Color(.cyan))
                .toolbarBackground(.cyan, for: .navigationBar)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Employee")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                    }
                }
//                .alert(isPresented: $showAlert){
//                    Alert(
//                        title: Text("Alert!"),
//                        message: Text("Are you sure you want to delete"),
//                        primaryButton: .default(Text("OK")),
//                        secondaryButton: .cancel()
//                    )
//                }
                
                if isLoading {
                    CircularLoader()
                }
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            getList()
        }
        .overlay {
            if showAlert {
                let _ = print("now show alert")
                CustomerAlert { isDelete in
                    showAlert = false
                    if isDelete {
                        deleteItem()
                    }
                }
            }
        }
    }
    
    private func deleteItem() {
        isLoading = true
        let url = APICaller.baseUrl + "/\(arrayEmployee[deleteIndex].id ?? 0)"
        APICaller.share.callAPI(url: url,
                                method: .delete,
                                params: nil,
                                responseType: EmployeeResponse.self) { (result) in
            isLoading = false
            switch result {
            case .success(let response):
                print("User ID: \(response.title ?? "")")
                withAnimation(.easeInOut(duration: 0.5)) {
                    arrayEmployee.remove(at: deleteIndex)
                }
            case .failure(let error):
                print("Error fetching user: \(error)")
            }
        }
    }
    
    private func getList() {
        isLoading = true
        APICaller.share.callAPI(url: APICaller.baseUrl,
                                method: .get,
                                params: nil,
                                responseType: [EmployeeResponse].self)
        { (result) in
            isLoading = false
            switch result {
            case .success(let response):
                print("User ID: \(response.count)")
                self.arrayEmployee = response
            case .failure(let error):
                print("Error fetching user: \(error)")
            }
        }
    }
}

#Preview {
    EmployeeList()
}

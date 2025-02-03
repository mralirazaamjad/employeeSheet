//
//  EmployeeResponse.swift
//  EmployeeSheet
//
//  Created by Ali Raza Amjad on 02/02/2025.
//

import Foundation

// MARK: - EmployeeListResponseElement
struct EmployeeResponse: Codable, Identifiable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias EmployeeListResponse = [EmployeeResponse]

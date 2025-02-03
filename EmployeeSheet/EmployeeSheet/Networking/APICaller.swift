//
//  APICaller.swift
//  EmployeeSheet
//
//  Created by Ali Raza Amjad on 02/02/2025.
//

import Foundation
import Alamofire

final class APICaller {
    static let baseUrl = "https://jsonplaceholder.typicode.com/posts"
    static let share = APICaller()
    let headers: HTTPHeaders = ["Content-Type": "application/json",
                                "Accept": "application/json"]
    
    private init() {}
    
    func callAPI<T: Decodable>(url: String,
                               method: HTTPMethod,
                               params: [String: Any]?,
                               responseType: T.Type,
                               completion: @escaping((Result<T, AFError>) -> Void)) {
        // Make the POST request using Alamofire
        AF.request(
            url,
            method: method,
            parameters: params,
            encoding: JSONEncoding.default,
            headers: self.headers
        )
        .validate()  // Automatically checks if the response code is 200-299
        .responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let decodedResponse):
                completion(.success(decodedResponse))
            case .failure(let error):
                print("Error: \(error)")
                completion(.failure(error))
            }
        }
    }
}

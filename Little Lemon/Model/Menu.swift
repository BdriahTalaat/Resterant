//
//  Menu.swift
//  Little Lemon
//
//  Created by Bdriah Talaat on 08/03/1446 AH.
//

import SwiftUI
import Foundation

struct MenuList: Decodable {
    let menu: [MenuItem]
}


struct MenuItem: Decodable,Hashable {
    let title: String
    let price: String
    let description: String
    let image: String
}

struct Menu {
    

    static func getMenuData(completion: @escaping (Result<[MenuItem], Error>) -> Void) {
        // Define the server URL string
        let serverURLString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        
        // Ensure the URL is valid
        guard let url = URL(string: serverURLString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        // Create the URLRequest
        let request = URLRequest(url: url)
        
        // Create a data task to fetch the menu data
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Handle the error
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Ensure we have data
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                return
            }
            
            // Decode the JSON data
            do {
                let decoder = JSONDecoder()
                let menuResponse = try decoder.decode(MenuList.self, from: data)
                // Pass the decoded object to the completion handler
                completion(.success(menuResponse.menu))
            } catch {
                completion(.failure(error))
            }
        }
        
        // Start the data task
        task.resume()
    }



}



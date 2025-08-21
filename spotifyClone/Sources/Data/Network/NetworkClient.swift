//
//  NetworkClient.swift
//  Spotify Clone
//
//  Created by Raphael Aniceto on 16/07/25.
//

import Foundation

final class NetworkClient {
    func get<T: Decodable>(url: URL) async  throws -> T {
        let (data, response ) = try await URLSession.shared.data(from: url)
        
        if let httpResponse = response as? HTTPURLResponse {
            print(" Status code: \(httpResponse.statusCode)")
            if !(200...299).contains(httpResponse.statusCode) {
                let body = String(data: data, encoding: .utf8) ?? "No response body"
                print(" Response body: \(body)")
                throw URLError(.badServerResponse)
            }
        }
        
        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }
        let decoded = try JSONDecoder().decode(T.self, from: data)
        return decoded
    }
    
    
}

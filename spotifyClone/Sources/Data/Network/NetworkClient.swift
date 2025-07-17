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
        
        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }
        let decoded = try JSONDecoder().decode(T.self, from: data)
        return decoded
    }
}

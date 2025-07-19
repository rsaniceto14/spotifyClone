//
//  SongRepositorie.swift
//  Spotify Clone
//
//  Created by Raphael Aniceto on 11/07/25.
//
// dados mockados com delay, sera uma chamada de rede real

import Foundation

final class SongRepositoryImpl: SongRepository {
    
    private let client = NetworkClient()
    
    func fetchSongs(term: String) async throws -> [Song]{
       guard let query = term.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            throw URLError(.badURL)
        }
        
        
        let urlString = "https://itunes.apple.com/search?term=\(query)&media=music&limit=20"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let response: SongResponseDTO = try await client.get(url: url)
        let songs = response.results.map(SongMapper.map)
        return songs
    }
}

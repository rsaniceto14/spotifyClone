//
//  SongRepositorie.swift
//  Spotify Clone
//
//  Created by Raphael Aniceto on 11/07/25.
//
// dados mockados com delay, sera uma chamada de rede real

import Foundation

final class SongRepositoryImpl: SongRepository {
    
    func fetchSongs() async throws -> [Song]{
        try await Task.sleep(nanoseconds: 500_000_000) //simula delay de rede
        
        return [
            Song(id: UUID().uuidString, title: "Bohemian Rhapsody", artist: "Queen"),
            Song(id: UUID().uuidString, title: "Shape of You", artist: "Ed Sheeeran"),
            Song(id: UUID().uuidString, title: "Smells Like Tenn Spirit", artist: "Nirvana"),
            Song(id: UUID().uuidString, title: "Blinding Lights", artist: "The Weeknd"),
            Song(id: UUID().uuidString, title: "Imagine", artist: "John Lennon"),
        ]
    }
}

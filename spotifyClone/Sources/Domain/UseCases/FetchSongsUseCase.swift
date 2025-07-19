//
//  FetchSongsUseCase.swift
//  Spotify Clone
//
//  Created by Raphael Aniceto on 11/07/25.
//
// UseCase Isolado que pode ser testado sozinho a ViewModel ira apenas chamar esse caso de uso

import Foundation

final class FetchSongsUseCase {
    private let repository: SongRepository
    
    init(repository: SongRepository){
        self.repository = repository
    }
    
    func execute(term: String) async throws -> [Song] {
        return try await repository.fetchSongs(term: term)
    }
}

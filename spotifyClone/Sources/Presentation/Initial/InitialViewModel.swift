//
//  InitialViewModel.swift
//  Spotify Clone
//
//  Created by Raphael Aniceto on 23/07/25.
//

import Foundation
import SwiftUI

@MainActor

final class InitialViewModel: ObservableObject {
    
    @Published var recentlyPlayed: [Song]?
    @Published var suggestions: [Song]?
//    @Published var playedTerm: String = "Eminem"
//    @Published var suggestionTerm: String = "Lose Yourself"
    
    private let repository: SongRepository = SongRepositoryImpl()
    
    
    func fetchSongs() async {
//        async let played = repository.fetchSongs(term: playedTerm)
//        async let suggested = repository.fetchSongs(term: suggestionTerm)
        recentlyPlayed = AudioPlayerManager.shared.fetchHistory()
        let suggestionTerm = recentlyPlayed?.first?.artist ?? "Eminem"
        
        do {
            suggestions = try await repository.fetchSongs(term: suggestionTerm)
        } catch {
            print("failed to fetch songs: \(error)")
        }
    }
}

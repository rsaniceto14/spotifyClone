//
//  HomeViewModel.swift
//  spotifyClone
//
//  Created by Raphael Aniceto on 01/07/25.
//

import Foundation
import Combine
import SwiftUI

@MainActor
final class HomeViewModel: ObservableObject{
    //    mark: - Public Properties
    @Published var path = NavigationPath()
    @Published var songs: [Song] = [] // mock - musics string list
    @Published var isLoading: Bool = false
    @Published var selectedSong: Song?
    
    @Published var searchTerm: String = ""
    
    
    // mark - Private
    
    private let fetchSongsUseCase: FetchSongsUseCase
    private let logger: LoggerService
    private var cancellables = Set<AnyCancellable>()
    
    //    mark - Initializers
    
    init(
        fetchSongsUseCase: FetchSongsUseCase = FetchSongsUseCase(repository: SongRepositoryImpl()),
        logger: LoggerService = LoggerEnvironment.logger) {
            self.fetchSongsUseCase = fetchSongsUseCase
            self.logger = logger
            logger.log("HomeViewModel initialized")
            
            $searchTerm
                .debounce(for: .milliseconds(600), scheduler: RunLoop.main)
                .removeDuplicates()
                .sink { [weak self] term in
                    guard let self = self else {return}
                    Task {
                        await self.fetchData()
                    }
                }
                .store(in: &cancellables)
            Task {
                await fetchData()
            }
        }
    //    mark fetch
    
    func fetchData() async {
        isLoading = true
        do {
            let result = try await fetchSongsUseCase.execute(term: searchTerm)
            self.songs = result
            logger.log("Loaded \(result.count) songs for '\(searchTerm)'")
        } catch {
            logger.error("❌ Failed to fetch songs: \(String(describing: error))")
        }
        isLoading = false
    }
    
    
    func refreshSongs() async {
        await fetchData()
    }
    
    func navigateToDetail(song: Song) {
        path.append(song)
    }
    
    
}

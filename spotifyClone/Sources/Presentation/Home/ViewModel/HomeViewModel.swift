//
//  HomeViewModel.swift
//  spotifyClone
//
//  Created by Raphael Aniceto on 01/07/25.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject{
    //    mark: - Public Properties
    
    @Published var songs: [Song] = [] // mock - musics string list
    @Published var isLoading: Bool = false
    
    
    
    // mark - Private
    
    private let fetchSongsUseCase: FetchSongsUseCase
    private let logger: LoggerService
    
    //    mark - Initializers
    
    init(
        fetchSongsUseCase: FetchSongsUseCase = FetchSongsUseCase(repository: SongRepositoryImpl()),
        logger: LoggerService = LoggerEnvironment.logger) {
            self.fetchSongsUseCase = fetchSongsUseCase
            self.logger = logger
            logger.log("HomeViewModel initialized")
            Task {
                await fetchData()
            }
    }
    
    //    mark - mocked fetch
    
    private func fetchData() async {
    isLoading = true
        do {
            let result = try await fetchSongsUseCase.execute()
            songs = result
            logger.log("Loaded \(result.count) songs")
        } catch {
            logger.error("Failed to fetch songs: \(error)")
        }
        isLoading = false
    }
}

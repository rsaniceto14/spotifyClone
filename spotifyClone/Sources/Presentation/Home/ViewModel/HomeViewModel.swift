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
    
    @Published var songs: [String] = [] // mock - musics string list
    
    // mark - Private
    
    private let logger: LoggerService
    
    //    mark - Initializers
    
    init(logger: LoggerService = LoggerEnvironment.logger) {
        self.logger = logger
        logger.log("HomeViewModel initialized")
        fetchMockData()
    }
    
    //    mark - mocked fetch
    
    private func fetchMockData(){
        //        use case calling future
        
        songs = [
            "Bohemian Rhapsody – Queen",
            "Blinding Lights – The Weeknd",
            "Shape of You – Ed Sheeran",
            "Take on Me – A-ha",
            "Smells Like Teen Spirit – Nirvana"
        ]
        logger.log("Loaded mock songs: \(songs.count) items")
    }
}

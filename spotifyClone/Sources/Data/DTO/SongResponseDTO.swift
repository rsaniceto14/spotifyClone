//
//  SongResponseDTO.swift
//  Spotify Clone
//
//  Created by Raphael Aniceto on 16/07/25.
//

import Foundation

struct SongResponseDTO: Decodable {
    let results: [SongDTO]
}

struct SongDTO: Decodable {
    let trackId: Int
    let trackName: String
    let artistName: String
    let artworkUrl100: String?
    let previewUrl: String?
}

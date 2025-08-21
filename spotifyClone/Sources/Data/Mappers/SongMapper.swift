//
//  SongMapper.swift
//  Spotify Clone
//
//  Created by Raphael Aniceto on 16/07/25.
//

import Foundation

enum SongMapper {
    static func map(dto: SongDTO) -> Song {
        return Song(
            id: String(dto.trackId),
            title: (dto.trackName),
            artist: (dto.artistName),
            artworkUrl: (dto.artworkUrl100),
            previewUrl: (dto.previewUrl)
        )
    }
}

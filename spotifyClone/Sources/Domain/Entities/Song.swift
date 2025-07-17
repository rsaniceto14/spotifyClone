//
//  Song.swift
//  Spotify Clone
//
//  Created by Raphael Aniceto on 11/07/25.
//

import Foundation

struct Song: Identifiable, Equatable, Hashable {
    let id: String
    let title: String
    let artist: String
    let artworkUrl: String?
}

//
//  SongRow.swift
//  Spotify Clone
//
//  Created by Raphael Aniceto on 17/07/25.
//

import Foundation
import SwiftUI

struct SongRow: View {
    let song: Song
    
    var body: some View {
        HStackLayout(alignment: .center, spacing: 16) {
            AsyncImage(url: URL(string: song.artworkUrl ?? "")) {
                phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 60, height: 60)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .cornerRadius(8)
                        .shadow(radius: 4)
                case .failure:
                    Image(systemName: "music.note")
                        .frame(width: 60, height: 60)
                        .foregroundColor(.gray)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                @unknown default:
                    EmptyView()
                }
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(song.title)
                    .font(.headline)
                    .lineLimit(1)
                Text(song.artist)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

//
//  SongDetailView.swift
//  Spotify Clone
//
//  Created by Raphael Aniceto on 17/07/25.
//

import SwiftUI

struct SongDetailView: View {
    let song: Song
    
    var body: some View {
        VStack(spacing: 24){
            AsyncImage(url: URL(string: song.artworkUrl ?? "")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 100, height: 100)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 200)
                        .cornerRadius(16)
                        .shadow(radius: 10)
                case .failure:
                    Image(systemName: "music.note")
                        .font(.system(size: 80))
                        .foregroundColor(.gray)
                        .frame(width: 200, height: 200)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(16)
                @unknown default:
                    EmptyView()
                }
            }
            
            VStack(alignment: .center, spacing: 8) {
                Text(song.title)
                    .font(.title)
                    .bold()
                Text(song.artist)
                    .font(.title3)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Detalhes")
    }
}

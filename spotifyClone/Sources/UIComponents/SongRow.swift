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
    
    @ObservedObject private var imageLoader = ImageLoader()
    
    var body: some View {
        HStack(alignment: .center, spacing: 16){
                if let image = imageLoader.image{
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .cornerRadius(8)
                        .shadow(radius: 4)
                    
                } else {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 60, height: 60)
                        
                        if imageLoader.isLoading{
                            ProgressView()
                        } else {
                            Image(systemName: "music.note")
                                .foregroundColor(.gray)
                        }
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
        .onAppear{
            if let urlString = song.artworkUrl,
               let url = URL(string: urlString) {
                Task {
                 await imageLoader.loadImage(from: url)
                }
            }
        }
    }
}

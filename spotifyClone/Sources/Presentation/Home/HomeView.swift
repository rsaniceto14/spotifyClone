//
//  HomeView.swift
//  spotifyClone
//
//  Created by Raphael Aniceto on 30/06/25.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack{
            Group {
                if viewModel.isLoading {
                    ProgressView("Carregando músicas")
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    List(viewModel.songs) {
                        song in
                        Button {
                            viewModel.selectedSong = song
                        } label: {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(song.title)
                                    .font(.headline)
                                Text(song.artist)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.vertical, 6)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Spotify Clone")
            .navigationDestination(item: $viewModel.selectedSong) {song in
                Text("Detalhes da musica: \(song.title)")
            }
            
        }
        .onAppear{
            LoggerEnvironment.logger.log("start view")
        }
    }
}

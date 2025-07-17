//
//  HomeView.swift
//  spotifyClone
//
//  Created by Raphael Aniceto on 30/06/25.
//
import Foundation
import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            Group {
                if viewModel.isLoading {
                    ProgressView("Carregando músicas")
                        .progressViewStyle(CircularProgressViewStyle(tint: .green))
                        .scaleEffect(1.5)
                } else {
                    List(viewModel.songs) {
                        song in
                        SongRow(song: song)
                            .listRowSeparator(.hidden)
                            .onTapGesture{
                                viewModel.path.append(song)
                            }
                    }
                    
                    .listStyle(.plain)
                    
                }
            }
            .navigationTitle("Explorar")
            .navigationDestination(for: Song.self) { song in
                SongDetailView(song: song)
            }
        }
    }
}


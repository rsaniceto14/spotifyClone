//
//  initialView.swift
//  Spotify Clone
//
//  Created by Raphael Aniceto on 19/07/25.
//

import Foundation
import SwiftUI


struct InitialView: View {
    @StateObject private var viewModel = InitialViewModel()
    @State private var searchText: String = ""
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                
                SearchBarView(text: $searchText)
                    .padding(.horizontal)
                
                ScrollView {
                    content
                        .padding(.horizontal)
                }
            }
            .navigationTitle("Home")
        }
        .task {
            await viewModel.fetchSongs()
        }
    }
    
    @ViewBuilder
    private var content: some View {
        VStack(alignment: .leading, spacing: 24) {
            sectionView(title: "Recently Played", songs: viewModel.recentlyPlayed)
            sectionView(title: "Suggestions", songs: viewModel.suggestions)
        }
    }
    
    @ViewBuilder
    private func sectionView(title: String, songs: [Song]? ) -> some View {
        if let songs = songs, !songs.isEmpty {
            SongSectionView(title: title) {
                LazyVStack(spacing: 16) {
                    ForEach(songs) { song in
                        SongRow(song: song) //component visual real para musica
                            .frame(maxWidth: 340, alignment: .leading) //alterar de acordo com layout
                    }
                }
            }
        } else {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .frame(maxWidth: .infinity)
                .padding()
        }
    }
}


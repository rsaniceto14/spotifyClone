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
        NavigationView{
            Group {
                if viewModel.isLoading {
                    ProgressView("Carregando músicas")
                } else {
                    List(viewModel.songs) {
                        song in
                        VStack(alignment: .leading) {
                            Text(song.title)
                                .font(.headline)
                            Text(song.artist)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                            .padding(.vertical, 8)
                        
                    }
                }
            }
            .navigationTitle("Spotify Clone")
            
        }
        .onAppear{
            LoggerEnvironment.logger.log("start view")
        }
    }
}

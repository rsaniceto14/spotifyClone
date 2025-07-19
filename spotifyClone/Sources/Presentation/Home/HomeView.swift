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
            VStack{
                TextField("What do you want to listen to?", text: $viewModel.searchTerm)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .padding(.top)
                    .onSubmit {
                        Task{
                            await viewModel.fetchData()
                        }
                    }
            }
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
                    .refreshable{
                        await viewModel.refreshSongs()
                    }
                    
                }
            }
            .navigationTitle("Explorar")
            .navigationDestination(for: Song.self) { song in
                SongDetailView(song: song)
            }
            .onAppear{
                Task{
                    await viewModel.fetchData()
                }
            }
        }
    }
}


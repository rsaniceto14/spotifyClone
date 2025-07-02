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
            List(viewModel.songs, id: \.self) { song in
                Text(song)
                    .padding(.vertical, 8)
            }
            .navigationTitle("Spotify Clone")
            
        }
        .onAppear{
            LoggerEnvironment.logger.log("start view")
        }
    }
}

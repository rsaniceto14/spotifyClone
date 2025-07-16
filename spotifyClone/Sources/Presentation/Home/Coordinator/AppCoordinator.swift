//
//  AppCoordinator.swift
//  Spotify Clone
//
//  Created by Raphael Aniceto on 13/07/25.
//

import Foundation

import SwiftUI

final class AppCoordinator: Coordinator, ObservableObject {
    
    @State var path = NavigationPath()
    
    var rootView: some View {
        NavigationStack(path: $path){
            HomeView()
                .environmentObject(self)
        }
    }
    
    func showSongDetails (song: Song) {
        path.append(song)
    }
}

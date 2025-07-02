//
//  spotifyCloneApp.swift
//  spotifyClone
//
//  Created by Raphael Aniceto on 18/06/25.
//

import SwiftUI

@main
struct spotifyCloneApp: App {
    @Environment(\.scenePhase) private var scenePhase // looking app life cycle (foreground, background)
    
    var body: some Scene {
        WindowGroup {
            HomeView()  // place where define the principal window
        }
        .onChange(of: scenePhase){
            switch scenePhase {
            case .active:
                LoggerEnvironment.logger.log("App became Active")
            case .inactive:
                LoggerEnvironment.logger.warning("App became Inactive")
            case .background:
                LoggerEnvironment.logger.log("App moved to background")
            default: break
            }
        }
    }
}

//all logs works 

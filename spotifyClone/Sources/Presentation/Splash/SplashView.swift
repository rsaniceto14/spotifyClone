//
//  SplashView.swift
//  Spotify Clone
//
//  Created by Raphael Aniceto on 19/07/25.
//

import Foundation
import SwiftUI

struct SplashView: View {
    
    @State private var isActive = false
    @State private var opacity = 0.0
    
    
    
    var body: some View {
        if isActive {
            InitialView()
        } else {
            ZStack {
                Color.black.ignoresSafeArea()
                Image("app_logo_splash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeInOut(duration: 1.5)) {
                            opacity = 1.0
                        }
                    }
            }
            
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}

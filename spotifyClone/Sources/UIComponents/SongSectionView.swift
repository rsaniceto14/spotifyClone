//
//  SongSection.swift
//  Spotify Clone
//
//  Created by Raphael Aniceto on 23/07/25.
//

import Foundation
import SwiftUI

struct SongSectionView<Content: View>: View {
    let title: String
    let content: () -> Content
    
    init(title: String, content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title3.bold())
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    content()
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical, 8)
    }
}

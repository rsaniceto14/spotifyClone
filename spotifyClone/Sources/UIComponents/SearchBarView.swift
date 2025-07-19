//
//  SearchBarView.swift
//  Spotify Clone
//
//  Created by Raphael Aniceto on 19/07/25.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    var onSubmit: (() -> Void)?

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)

            TextField("What do you want to listen to?", text: $text)
                .foregroundColor(.primary)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .onSubmit {
                    onSubmit?()
                }
        }
        .padding(10)
        .background(Color(.systemGray5))
        .cornerRadius(12)
        .padding(.horizontal)
        .padding(.top, 8)
    }
}

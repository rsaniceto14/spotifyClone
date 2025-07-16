//
//  CoordinatorProtocol.swift
//  Spotify Clone
//
//  Created by Raphael Aniceto on 13/07/25.
//

import Foundation
import SwiftUI


protocol Coordinator: ObservableObject {
    associatedtype ContentView: View
    var rootView: ContentView {get}
}

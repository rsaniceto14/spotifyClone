//
//  Player.swift
//  Spotify Clone
//
//  Created by Raphael Aniceto on 12/08/25.
//

import Foundation
import AVFoundation


@MainActor
final class AudioPlayerManager: ObservableObject {
    static let shared = AudioPlayerManager()
    
    private var player: AVPlayer?
    
    @Published var isPlaying: Bool = false
    @Published var currentSong: Song?
    
    private let historyKey = "recentPlayedSongs"
    
    private init() {}
    
    private func setupAudioSession(){
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Error in Audio Session: \(error)")
        }
    }
    
    func play(song: Song) {
        setupAudioSession()
        guard let urlString = song.previewUrl, let url = URL(string: urlString) else {
            print("Invalid preview URL for song: \(song.title)")
            return
        }
        
        if currentSong?.id == song.id, isPlaying {
            pause()
            return
        }
        
        currentSong = song
        player = AVPlayer(url: url)
        player?.play()
        isPlaying = true
        
        saveToHistory(song)
    }
    
    func pause() {
        player?.pause()
        isPlaying = false
    }
    
    private func saveToHistory(_ song: Song) {
        var history = fetchHistory()
        
        if history.contains(where: { $0.id == song.id}) {
            return
        }
        
        history.insert(song, at: 0)
        if history.count > 20 {
            history.removeLast()
        }
        
        if let data = try? JSONEncoder().encode(history){
            UserDefaults.standard.set(data, forKey: historyKey)
        }
    }
    
    func fetchHistory() -> [Song] {
        guard let data = UserDefaults.standard.data(forKey: historyKey),
              let songs = try? JSONDecoder().decode([Song].self, from: data) else {
            return []
        }
        return songs
    }
}

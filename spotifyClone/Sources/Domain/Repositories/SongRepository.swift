//
//  SongRepository.swift
//  Spotify Clone
//
//  Created by Raphael Aniceto on 12/07/25.
//

import Foundation

//interface que define o que o repositorio precisa entregar (camada Presentation e UseCase nao sabem se o dados vem de api,banco ou mock

protocol SongRepository{
    func fetchSongs() async throws -> [Song]
}

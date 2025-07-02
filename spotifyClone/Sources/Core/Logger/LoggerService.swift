//
//  LoggerService.swift
//  spotifyClone
//
//  Created by Raphael Aniceto on 29/06/25.
//

// Objetivo LoggerService - Centralizar logs de debug e eventos do app, seguir Clean Arch com camadas desacopladas, suporte para diferentes comportamentos por ambiente, Facil substituicao de consoles por exemplo (Firebase ou Sentry) Esse protocolo será usado em qualquer camada que precise registrar logs, sem se preocupar com onde ou como os logs são exibidos.

import Foundation

protocol LoggerService {
    func log(_ message: String)
    func warning(_ message: String)
    func error(_ message: String)
}

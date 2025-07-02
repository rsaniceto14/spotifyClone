//
//  LoggerEnvironment.swift
//  spotifyClone
//
//  Created by Raphael Aniceto on 29/06/25.
//

import Foundation

enum AppEnvironment {
    case dev
    case prod
}

final class LoggerEnvironment{
    static let current: AppEnvironment = .dev
    static var logger: LoggerService {
        switch current {
        case .dev:
            return ConsoleLogger()
        case .prod:
            return ConsoleLogger() //substituir futuramente 
        }
    }
}

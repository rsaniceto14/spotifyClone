//
//  ConsoleLogger.swift
//  spotifyClone
//
//  Created by Raphael Aniceto on 29/06/25.
//

import Foundation

final class ConsoleLogger: LoggerService {
    func log(_ message: String) {
        print("[LOG]: \(message)")
    }
    
    func warning(_ message: String) {
        print("[WARNING]: \(message)")
    }
    
    func error(_ message: String) {
        print("[ERROR]: \(message)")
    }
}

//
//  ScoreTrackerApp.swift
//  ScoreTracker
//
//  Created by Joe Barber on 5/19/23.
//

import SwiftUI

@main
struct ScorekeeperApp: App {
    @StateObject var gameManager = GameManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.colorScheme, .dark)
                .environmentObject(gameManager)
            
        }
    }
}

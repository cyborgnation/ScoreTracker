//
//  ContentView.swift
//  ScoreTracker
//
//  Created by Joe Barber on 5/19/23.
//

import SwiftUI
struct ContentView: View {
    @EnvironmentObject var gameManager: GameManager

    var body: some View {
        VStack {
            TextField("Player name", text: $newPlayerName)
            Button("Add player") {
                gameManager.addPlayer(name: newPlayerName)
                newPlayerName = ""
            }
            .disabled(newPlayerName.isEmpty || gameManager.players.count >= 8)
            
            ScoreBoardView()
                .environmentObject(gameManager)
            
            Button("Toggle sort order") {
                gameManager.toggleSortOrder()
            }
            Button("Reset scores") {
                gameManager.resetScores()
            }
        }
        .padding()
    }
    
    @State private var newPlayerName: String = ""
}


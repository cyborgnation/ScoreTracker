//
//  AddPlayerView.swift
//  ScoreTracker
//
//  Created by Joe Barber on 5/19/23.
//

import SwiftUI

struct AddPlayerView: View {
    @EnvironmentObject var gameManager: GameManager
    @State private var newPlayerName: String = ""

    var body: some View {
        VStack {
            TextField("Player Name", text: $newPlayerName)
                .textFieldStyle(.roundedBorder)
                .padding()

            Button("Add Player") {
                if newPlayerName != "" && gameManager.players.count < 8 {
                    gameManager.addPlayer(name: newPlayerName)
                    newPlayerName = ""
                }
            }
        }
    }
}

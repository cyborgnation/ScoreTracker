//
//  ScoreBoardView.swift
//  ScoreTracker
//
//  Created by Joe Barber on 5/19/23.
//

import SwiftUI
struct ScoreBoardView: View {
    @EnvironmentObject var gameManager: GameManager

    var body: some View {
        VStack {
            ForEach(gameManager.sortedPlayers) { player in
                HStack {
                    Text(player.name)
                    Spacer()
                    Text("\(player.score)")
                    ScoreModifierView(playerId: player.id)
                }
            }
            Button("Reset Scores") {
                gameManager.resetScores()
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}


struct ScoreModifierView: View {
    @EnvironmentObject var gameManager: GameManager
    let playerId: UUID

    var body: some View {
        HStack {
            Button(action: {
                gameManager.updateScore(id: playerId, by: -1)
            }) {
                Text("-")
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
                    .background(Color.red)
                    .clipShape(Circle())
            }
            Button(action: {
                gameManager.updateScore(id: playerId, by: 1)
            }) {
                Text("+")
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
                    .background(Color.green)
                    .clipShape(Circle())
            }
        }
    }
}


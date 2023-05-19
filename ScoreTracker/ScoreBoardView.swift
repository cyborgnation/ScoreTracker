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
        List {
            ForEach(gameManager.sortedPlayers) { player in
                HStack {
                    Text(player.name)
                    Spacer()
                    Button(action: { gameManager.updateScore(id: player.id, by: -1) }) {
                        Text("-")
                    }
                    Text("\(player.score)")
                        .onReceive(player.$score) { _ in }
                    Button(action: { gameManager.updateScore(id: player.id, by: 1) }) {
                        Text("+")
                    }
                }
            }
        }
    }
}

struct ScoreModifierView: View {
    let modifyScore: (Int) -> Void
    let score: Int

    var body: some View {
        HStack {
            Button(action: { modifyScore(-1) }) {
                Text("-")
            }
            Text("\(score)")
            Button(action: { modifyScore(1) }) {
                Text("+")
            }
        }
    }
}

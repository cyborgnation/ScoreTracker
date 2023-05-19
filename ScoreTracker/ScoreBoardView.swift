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
            ForEach(gameManager.sortedPlayers.indices, id: \.self) { index in
                let player = gameManager.sortedPlayers[index]
                HStack {
                    Text(player.name)
                    Spacer()
                    Button(action: { gameManager.updateScore(at: index, by: -1) }) {
                        Text("-")
                    }
                    Text("\(player.score)")
                    Button(action: { gameManager.updateScore(at: index, by: 1) }) {
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

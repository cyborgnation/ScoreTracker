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
                    Button(action: { self.gameManager.updateScore(id: player.id, by: -1) }) {
                        Text("-")
                            .font(.largeTitle)
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.white)
                            .background(Color.red)
                            .clipShape(Circle())
                    }
                    Text("\(player.score)")
                    Button(action: { self.gameManager.updateScore(id: player.id, by: 1) }) {
                        Text("+")
                            .font(.largeTitle)
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.white)
                            .background(Color.green)
                            .clipShape(Circle())
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

//
//  ScoreBoardView.swift
//  ScoreTracker
//
//  Created by Joe Barber on 5/19/23.
//

import SwiftUI
struct ScoreBoardView: View {
    @EnvironmentObject var gameManager: GameManager
    let colors: [Color] = [.red, .green, .blue, .yellow, .pink, .purple, .orange, .gray]

    var body: some View {
        ScrollView {
            VStack {
                ForEach(gameManager.players) { player in
                    let index = gameManager.players.firstIndex(where: { $0.id == player.id }) ?? 0
                    HStack {
                        Text(player.name)
                        Spacer()
                        Text("\(player.score)")
                    }
                    .padding()
                    .background(colors[index % colors.count])
                    .foregroundColor(.black)
                }
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

    func getColorForIndex(_ index: Int) -> Color {
        let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .indigo, .purple]
        return colors[index % colors.count]
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
                Image(systemName: "minus")
                    .foregroundColor(.black)
                    .frame(width: 30, height: 30)
                    .background(Color.red)
                    .clipShape(Circle())
            }
            Button(action: {
                gameManager.updateScore(id: playerId, by: 1)
            }) {
                Image(systemName: "plus")
                    .foregroundColor(.black)
                    .frame(width: 30, height: 30)
                    .background(Color.green)
                    .clipShape(Circle())
            }
        }
    }
}


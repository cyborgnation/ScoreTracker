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
            ForEach(gameManager.sortedPlayers.indices, id: \.self) { index in
                let player = gameManager.sortedPlayers[index]
                HStack {
                    Text(player.name)
                        .foregroundColor(getColorForIndex(index))
                        .font(.custom("Futura", size: 24))
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


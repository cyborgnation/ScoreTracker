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
        VStack {
            Button(action: {
                gameManager.toggleSortingOrder()
            }) {
                Text("Toggle Sorting Order")
            }
            .padding()
            ScrollView {
                VStack {
                    ForEach(Array(gameManager.sortedPlayers.enumerated()), id: \.element.id) { index, player in
                        HStack {
                            Text(player.name)
                            Spacer()
                            Button(action: {
                                gameManager.players[index].score += 1
                            }) {
                                Image(systemName: "plus")
                            }
                            Text("\(player.score)")
                            Button(action: {
                                gameManager.players[index].score -= 1
                            }) {
                                Image(systemName: "minus")
                            }
                        }
                        .padding()
                        .background(colors[abs(player.id.hashValue) % colors.count])
                        .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

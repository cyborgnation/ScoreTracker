//
//  GameManager.swift
//  ScoreTracker
//
//  Created by Joe Barber on 5/19/23.
//
import SwiftUI
import Combine

class GameManager: ObservableObject {
    @Published var players: [Player] = []
    var isSortedByDescending: Bool = true
    
    var sortedPlayers: [Player] {
        return isSortedByDescending ? players.sorted(by: { $0.score > $1.score }) : players.sorted(by: { $0.score < $1.score })
    }

    func addPlayer(name: String) {
        let player = Player(name: name, score: 0)
        players.append(player)
        print(players)
    }
    
    func updateScore(at index: Int, by score: Int) {
        players[index].score += score
        print(players)
    }

    func toggleSortOrder() {
        isSortedByDescending.toggle()
    }
    
    func resetScores(to score: Int = 0) {
        for index in players.indices {
            players[index].score = score
        }
    }
}








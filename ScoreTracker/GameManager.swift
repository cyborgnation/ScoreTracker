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
    var sortedPlayers: [Player] {
        return players.sorted {
            return self.sortAscending ? $0.score < $1.score : $0.score > $1.score
        }
    }
    
    var sortAscending: Bool = false
    
    func addPlayer(name: String) {
        let player = Player(name: name, score: 0)
        players.append(player)
    }
    
    func updateScore(id: UUID, by score: Int) {
        // Find the index of the player with the given ID
        if let index = players.firstIndex(where: { $0.id == id }) {
            // Update the player's score
            players[index].score += score
            
            // Recreate the players array to force SwiftUI to redraw the views
            players = players.map { $0 }
        }
    }
    
    func resetScores(to score: Int = 0) {
        // Reset scores and recreate the players array to force SwiftUI to redraw the views
        players = players.map { player in
            var player = player
            player.score = score
            return player
        }
    }
    
    func toggleSortOrder() {
        sortAscending.toggle()
    }
}








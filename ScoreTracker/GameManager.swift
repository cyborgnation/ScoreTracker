//
//  GameManager.swift
//  ScoreTracker
//
//  Created by Joe Barber on 5/19/23.
//
import SwiftUI
import Combine
class GameManager: ObservableObject {
    @Published var players: [Player] = [] {
        didSet {
            cancellables.forEach { $0.cancel() }
            cancellables = []
            for player in players {
                let cancellable = player.$score.sink { [weak self] _ in
                    self?.objectWillChange.send()
                }
                cancellables.append(cancellable)
            }
        }
    }
    private var cancellables: [AnyCancellable] = []

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
        if let player = players.first(where: { $0.id == id }) {
            player.score += score
        }
    }
    
    func resetScores(to score: Int = 0) {
        players.forEach { $0.score = score }
    }
    
    func toggleSortOrder() {
        sortAscending.toggle()
    }
}




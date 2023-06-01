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
    @Published var sortingOrder: SortingOrder = .descending
    private var cancellables: [AnyCancellable] = []
    var subscriptions = Set<AnyCancellable>()

     init() {
         // Create a timer that starts when a player's score changes and triggers sorting when it expires.
         players.forEach { player in
             player.scoreWillChange
                 .debounce(for: .seconds(2), scheduler: RunLoop.main)
                 .sink { [weak self] in
                     self?.objectWillChange.send()
                 }
                 .store(in: &subscriptions)
         }
     }

     var sortedPlayers: [Player] {
         switch sortingOrder {
         case .ascending:
             return players.sorted { $0.score < $1.score }
         case .descending:
             return players.sorted { $0.score > $1.score }
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
    
    enum SortingOrder {
        case ascending
        case descending
    }
    
    func toggleSortingOrder() {
        if sortingOrder == .ascending {
            sortingOrder = .descending
        } else {
            sortingOrder = .ascending
        }
    }
}




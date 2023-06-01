//
//  Player.swift
//  ScoreTracker
//
//  Created by Joe Barber on 5/19/23.
//

import Combine
import Foundation

class Player: ObservableObject, Identifiable {
    let id = UUID()
    @Published var name: String
    @Published var score: Int
    var scoreWillChange = PassthroughSubject<Void, Never>()

    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }

    func changeScore(by amount: Int) {
        self.scoreWillChange.send()
        DispatchQueue.main.async {
            self.score += amount
        }
    }

}

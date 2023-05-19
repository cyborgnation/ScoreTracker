//
//  Player.swift
//  ScoreTracker
//
//  Created by Joe Barber on 5/19/23.
//

import Foundation

class Player: ObservableObject, Identifiable {
    let id: UUID
    let name: String
    @Published var score: Int

    init(name: String, score: Int = 0) {
        self.id = UUID()
        self.name = name
        self.score = score
    }
}

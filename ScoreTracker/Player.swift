//
//  Player.swift
//  ScoreTracker
//
//  Created by Joe Barber on 5/19/23.
//

import Foundation

struct Player: Identifiable {
    let id: UUID
    let name: String
    var score: Int
    
    init(name: String, score: Int) {
        self.id = UUID()
        self.name = name
        self.score = score
    }
}

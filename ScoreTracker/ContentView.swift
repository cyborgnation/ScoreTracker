//
//  ContentView.swift
//  ScoreTracker
//
//  Created by Joe Barber on 5/19/23.
//

import SwiftUI
struct ContentView: View {
    @EnvironmentObject var gameManager: GameManager
    @State private var newPlayerName = ""
    
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            NavigationView {
                VStack {
                    HStack {
                        TextField("Enter player's name...", text: $newPlayerName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        Button("Add Player") {
                            gameManager.addPlayer(name: newPlayerName)
                            newPlayerName = ""
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    
                    ScoreBoardView()
                        .environmentObject(gameManager)
                }
                .padding(.top)
                .navigationTitle("Score Keeper")
            }
            .background(Color.clear)
        }
    }
}

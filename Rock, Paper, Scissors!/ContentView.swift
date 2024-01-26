//
//  ContentView.swift
//  Rock, Paper, Scissors!
//
//  Created by Kyle Housel on 1/21/24.
//

import SwiftUI

struct ContentView: View {
    @State private var plays = ["rock", "paper", "scissors"]
    @State private var rpsButtons = ["🪨", "📃", "✂️"]
    
    @State private var appChoice = ""
    @State private var playerChoice = ""
    
    @State private var playerScore = 0
    @State private var appScore = 0

    @State private var outcome = ""
    
    
    
    var body: some View {
        ZStack {
            
            LinearGradient(colors: [.cyan, .black], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                //game title
                Spacer()
                Text("Rock Paper Scissors!")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                
                Spacer()
                Spacer()
                //player's move: 3 button options
                HStack {
                    ForEach(0..<3) { choice in
                        Button {
                            handleButtonTapped(choice)
                        } label: {
                            Text(rpsButtons[choice])
                                .font(.system(size: 80))
                                .padding()
                        }
                    }
                    
                }
                
                Spacer()
                
                VStack {
                    HStack {
                        //add visual of playerChoice vs appChoice?
                    }
                    Text("\(outcome)")
                        .font(.title3.bold())
                        .foregroundColor(.white)
                    
                }
                Spacer()
                Spacer()
                
                HStack(spacing: 100) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Player Score: \(playerScore)")
                            .font(.title2.bold())
                            .foregroundStyle(.white)
                        Text("App Score: \(appScore)")
                            .font(.title2.bold())
                            .foregroundStyle(.white)
                    }
                    
                    Button {
                        resetGame()
                    } label: {
                        Text("Reset")
                            .padding()
                            .foregroundColor(Color.cyan)
                            .background(Color(red: 0.1, green: 0.1, blue: 0.1))
                            .cornerRadius(90)
                    }
                }
                
                
            }
            .padding()
        }
    }
    
    func choiceTapped(_ choice: Int) -> String {
        //playGame.toggle()
        if choice == 0 {
            playerChoice = plays[0]
        } else if choice == 1 {
            playerChoice = plays[1]
        } else {
            playerChoice = plays[2]
        }
        return playerChoice
    }
    
    func getAppChoice(array: [String]) -> String {
        guard let appMove = array.randomElement() else {
            return "Error: App could not make its move!"
        }
        self.appChoice = appMove
        return appMove
    }
    
    func handleButtonTapped(_ choice: Int) {
        let playerMove: String = choiceTapped(choice)
        let appMove: String = getAppChoice(array: plays)

        if ((playerMove == "rock" && appMove == "scissors") || (playerMove == "paper" && appMove == "rock") || (playerMove == "scissors" && appMove == "paper")) {
            playerScore += 1
            outcome = "\(playerMove.capitalized) beats \(appMove)!"
        } else if (playerMove == appMove) {
            outcome = "You tied!"
        } else {
            appScore += 1
            outcome = "\(appMove.capitalized) beats \(playerMove)!"
        }
    }
    
    func resetGame() {
        playerScore = 0
        appScore = 0
        outcome = "New game!"
    }

        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

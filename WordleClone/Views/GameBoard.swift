    //
    //  GameBoard.swift
    //  WordleClone
    //
    //  Created by Arthur Ford on 2/18/23.
    //

import SwiftUI

struct GameBoard: View {
    
    @EnvironmentObject var game: Game
    
    @State private var guess = ""
    
    //@State private var turnsRemaining: Int = 5
    
    private let textlimit = 5
    
    var body: some View {
        
        VStack(alignment: .center) {
            TextField("Make a Guess", text: $guess)
                .textCase(.uppercase)
                .padding(10)
                .border(.gray)
                .padding(10)
                .autocorrectionDisabled(true)
                .disabled(game.gameOver || game.gameWon)
                .onSubmit {
                    
                    fixText(textlimit)
                    
                    game.makeAGuess(guess: guess)
                    guess = ""
                    //turnsRemaining -= 1
                }
                .submitLabel(.go)
            //Text(game.word)
            ForEach(Array(game.guesses.enumerated()), id: \.element) { index, element in
                GameRow(word: element, rowNumber: index)
                    .environmentObject(game)
            }
            ForEach(0..<game.turnsRemaining, id: \.self) { index in
                GameRow(word: Guess.blankSpace)
                    .environmentObject(game)
            }
            if game.gameOver {
                Button {
                    game.setUpGame()
                    
                } label: {
                    Text("Try Again?")
                }
            }
            Spacer()
        }
    }
    
    func fixText(_ upper: Int) {
        if guess.count < upper {
            guess = guess.padding(toLength: textlimit, withPad: " ", startingAt: 0)
        }
        
        if guess.count > upper {
            guess = String(guess.prefix(upper))
        }
    }
}

struct GameBoard_Previews: PreviewProvider {
    static var previews: some View {
        GameBoard()
            .environmentObject(Game())
    }
}


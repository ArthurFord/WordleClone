    //
    //  GameRow.swift
    //  WordleClone
    //
    //  Created by Arthur Ford on 2/18/23.
    //

import SwiftUI

struct GameRow: View {
    
    @EnvironmentObject var game: Game
    @State var word: Guess
    var rowNumber = 0
    
    var body: some View {
        HStack {
            ForEach(word.word) { letter in
                LetterBox(letter: letter)
                    .environmentObject(game)
            }
        }
    }
}

struct GameRow_Previews: PreviewProvider {
    static var previews: some View {
        GameRow(word: Guess(word: [Letter(letter: "W", index: 0)], turnGuessed: 0))
            .environmentObject(Game())
    }
}

    //
    //  Game.swift
    //  WordleClone
    //
    //  Created by Arthur Ford on 2/17/23.
    //

import Foundation

class Game: ObservableObject {
    
    @Published var word = ""
    @Published var turn = 0
    @Published var maxTurns = 5
    var turnsRemaining: Int {
        maxTurns - turn
    }
    @Published var answer: [Letter] = []
    @Published var guesses: [Guess] = []
    var gameWon = false
    var gameOver: Bool {
        turn == maxTurns
    }
    
    init() {
        setUpGame()
    }
    
    func setUpGame() {
            //set the answer word
        word = ListOfWords().words.randomElement()!.uppercased()
        turn = 0
        
        var letterIndex = 0
        
            //Create Letters from answer word
        for letter in word {
            let newGuessedLetter = Letter(letter: String(letter), index: letterIndex)
            answer.append(newGuessedLetter)
            letterIndex += 1
        }
        
        //clear last game's guesses
        guesses = []
    }
    
    func makeAGuess(guess: String) {
        
        
        var guessedLetters: [Letter] = []
        var letterIndex = 0        
        
            //Create Letters from guess
        for letter in guess.uppercased() {
            guessedLetters.append(Letter(letter: String(letter), index: letterIndex))
            letterIndex += 1
        }
            //add guess to array of guesses
        let newGuess = Guess(word: guessedLetters, turnGuessed: self.turn)
        guesses.append(newGuess)
        
        for guessLetter in guessedLetters {
            for answerLetter in answer {
                if guessLetter.index == answerLetter.index && guessLetter.letter == answerLetter.letter {
                        // status = .inPosition
                    self.guesses[turn].word[guessLetter.index].status = .inPosition
                    break
                } else if guessLetter.letter == answerLetter.letter {
                        // status = .notInPosition
                    self.guesses[turn].word[guessLetter.index].status = .notInPosition
                    break
                } else {
                        // status = .notInWord
                    self.guesses[turn].word[guessLetter.index].status = .notInWord
                }
            }
        }
        
        //check for win
        gameWon = checkForWin(guess)
        turn += 1
    }
    
    func checkForWin(_ guess: String) -> Bool {
        
        if guess == word {
            return true
        } else {
            return false
        }
    }
}

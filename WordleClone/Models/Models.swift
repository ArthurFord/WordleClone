//
//  Models.swift
//  WordleClone
//
//  Created by Arthur Ford on 2/17/23.
//

import Foundation

enum LetterStatus: String {
    case unknown = "Unknown"
    case notInWord = "Not in Word"
    case notInPosition = "In Word, But Not This Position"
    case inPosition = "Correct and In Position"
}

struct Letter: Identifiable, Equatable, Hashable {
    var id = UUID()
    var letter: String
    var index: Int
    var status: LetterStatus = .unknown
}

struct Guess: Identifiable, Hashable {
    static func == (lhs: Guess, rhs: Guess) -> Bool {
        return lhs.word == rhs.word
    }
    
    var id = UUID()
    var word: [Letter]
    var turnGuessed: Int
    var status: GuessStatus = .unknown
}

enum GuessStatus: String {
    case match = "match"
    case notMatch = "Not a match"
    case unknown = "Unknown"
}

extension Guess {
    static var blankSpace = Guess(word: [Letter(letter: "", index: 0), Letter(letter: "", index: 1), Letter(letter: "", index: 2), Letter(letter: "", index: 3), Letter(letter: "", index: 4)], turnGuessed: 0)
}

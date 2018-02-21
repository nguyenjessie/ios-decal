//
//  HangmanGame.swift
//  Hangman
//
//  Created by Jessie Nguyen on 2/20/2018.
//  Copyright © 2018 iOS DeCal. All rights reserved.
//

import UIKit

class HangmanGame {
    var currentPhrase: String? // current phrase the game uses
    var currentPhraseArray = [Character]() // array of characters
    var currentPhraseBool = [Bool]() // check if letter
    var gameLetters = Set<String>() // answer letters
    var wrongGuesses = Set<String>() // wtrong guesses
    var wrongDisplay: String? // displays wrong guesses ???
    var prevGuessed = Set<String>()
    
    init() {
        let phrase: String = HangmanPhrases().getRandomPhrase()
        currentPhrase = phrase
        currentPhraseArray = Array(phrase)
        currentPhraseBool = [Bool]()
        gameLetters = Set<String>()
        wrongGuesses = Set<String>()
        wrongDisplay = "Incorrect Guesses:"
        prevGuessed = Set<String>()
        
        for letter in currentPhrase! {
            if (letter == " ") { // if space, they don't need to guess
                currentPhraseBool.append(true)
            } else {
                currentPhraseBool.append(false)
                gameLetters.insert(String(letter))
            }
        }
    }
    
    func winGame() -> Bool {
        for letter in currentPhraseBool {
            if !letter { // if letter is not guessed
                return false
            }
        }
        return true
    }
    
    func displayText() -> String {
        var text = ""
        var i = 0
        for letter in currentPhrase! {
            if (letter == " ") {
                text += "  "
            } else {
                if (currentPhraseBool[i] == false) {
                    text += "_ "
                } else {
                    text += String(letter) + " "
                }
            }
            i += 1
        }
        return text
    }
    
    func updateDisplay(wrongLetter: String) {
        wrongDisplay = wrongDisplay! + " " + wrongLetter
    }
    
    func newGame() {
        let phrase: String = HangmanPhrases().getRandomPhrase()
        currentPhrase = phrase
        currentPhraseArray = Array(phrase)
        currentPhraseBool = [Bool]()
        gameLetters = Set<String>()
        wrongGuesses = Set<String>()
        wrongDisplay = "Incorrect Guesses:"
        prevGuessed = Set<String>()
        
        for letter in phrase {
            if (letter == " ") { // if space, they don't need to guess
                currentPhraseBool.append(true)
            } else {
                currentPhraseBool.append(false)
                gameLetters.insert(String(letter))
            }
        }
    }
}

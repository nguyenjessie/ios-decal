//
//  HangmanViewController.swift
//  Hangman
//
//  Created by Jessie Nguyen on 2/20/2018.
//  Copyright © 2018 iOS DeCal. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {
    
    var hangmanGame = HangmanGame() // game instance
    
    @IBOutlet weak var hangmanImage: UIImageView!
    var imageNumber = 1 // empty hangman image
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var displayText: UILabel!
    @IBOutlet weak var wrongLetters: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hangmanGame.newGame()
        hangmanImage.image = UIImage(named: "hangman1.png")
        imageNumber = 1
        displayText.text = hangmanGame.displayText()
    }
    
    @IBAction func submitGuess(_ sender: Any) {
        let guess = inputText.text
        if (guess?.count != 1) { // not correct input aka not a letter
            let alertGuess = UIAlertController(
                title: "Input Error",
                message: "Only letters are acceptable.",
                preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertGuess.addAction(OKAction)
            self.present(alertGuess, animated: true, completion: nil)
        }
        else if (hangmanGame.prevGuessed.contains(guess!.uppercased())) { // already guessed
            let alertAlready = UIAlertController(
                title: "Already Guessed",
                message: "You have already guessed this letter.",
                preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Close", style: .default, handler: nil)
            alertAlready.addAction(OKAction)
            self.present(alertAlready, animated: true, completion: nil)
        }
        else {
            let guessCap = guess!.uppercased() // create capital letter
            if (hangmanGame.gameLetters.contains(guessCap)) { // correct letter
                for i in 0...hangmanGame.currentPhrase!.count - 1 {
                    if(guessCap == String(hangmanGame.currentPhraseArray[i])) {
                        hangmanGame.currentPhraseBool[i] = true
                        hangmanGame.prevGuessed.insert(guessCap)
                    }
                }
                displayText.text = hangmanGame.displayText()
                
                if (hangmanGame.winGame()) { // check if guessed all letters
                    let alertWinner = UIAlertController(
                        title: "You Win",
                        message: "Yay!",
                        preferredStyle: .alert)
                    let newGameButton = UIAlertAction(title: "New Game", style: .default) {
                        action in self.reset()
                    }
                    alertWinner.addAction(newGameButton)
                    self.present(alertWinner, animated: true, completion: nil)
                }
                emptyTextField()
            }
            else { // wrong letter and lower life
                hangmanGame.prevGuessed.insert(guessCap)
                hangmanGame.wrongGuesses.insert(guess!)
                hangmanGame.updateDisplay(wrongLetter: guess!)
                wrongLetters.text = hangmanGame.wrongDisplay
                displayText.text = hangmanGame.displayText()
                imageNumber += 1
                updateHangmanImageDisplay()
                if (imageNumber > 6) { // check if all lives are used
                    let alertLoser = UIAlertController(
                        title: "You lost!",
                        message: "Try again.",
                        preferredStyle: .alert)
                    let newGameAction = UIAlertAction(title: "New Game", style: .default) {
                        action in self.reset()
                    }
                    alertLoser.addAction(newGameAction)
                    self.present(alertLoser, animated: true, completion: nil)
                }
                emptyTextField()
            }
        }
    }
    
    func updateHangmanImageDisplay() {
        if (imageNumber == 1) { hangmanImage.image = UIImage(named: "hangman1.png") }
        if (imageNumber == 2) { hangmanImage.image = UIImage(named: "hangman2.png") }
        if (imageNumber == 3) { hangmanImage.image = UIImage(named: "hangman3.png") }
        if (imageNumber == 4) { hangmanImage.image = UIImage(named: "hangman4.png") }
        if (imageNumber == 5) { hangmanImage.image = UIImage(named: "hangman5.png") }
        if (imageNumber == 6) { hangmanImage.image = UIImage(named: "hangman6.png") }
        if (imageNumber > 6) { hangmanImage.image = UIImage(named: "hangman7.png") }
    }
    
    @IBAction func startOver(_ sender: Any) {
        let alertRusure = UIAlertController(
            title: "Start Over",
            message: "Start a new game?",
            preferredStyle: .alert)
        let newGameButton = UIAlertAction(title: "New Game", style: .default) {
            action in self.reset()
        }
        let OKAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertRusure.addAction(OKAction)
        alertRusure.addAction(newGameButton)
        self.present(alertRusure, animated: true, completion: nil)
    }
    
    func reset() {
        emptyTextField()
        hangmanImage.image = UIImage(named: "hangman1.png")
        hangmanGame.newGame()
        imageNumber = 1
        displayText.text = hangmanGame.displayText()
        wrongLetters.text = hangmanGame.wrongDisplay
    }
    
    func emptyTextField() {
        inputText.text = ""
    }
}

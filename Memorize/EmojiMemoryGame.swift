//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Muhammad Umar on 6/28/20.
//  Copyright © 2020 Muhammad Umar. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    static var emojiTheme: EmojiTheme = EmojiTheme(name: nil, emojis: nil, color: nil)
    
    static func createMemoryGame() -> MemoryGame<String> {
        let chosenTheme = Int.random(in: 0...4)
        if (chosenTheme == 0) {
            emojiTheme = EmojiTheme(name: "Halloween", emojis: ["👻", "🎃", "🕷", "🦇", "🐈"], color: Color.orange)
        } else if (chosenTheme == 1) {
            emojiTheme = EmojiTheme(name: "Animals", emojis: ["🐶", "🐥", "🦎", "🐢", "🦀"], color: Color.green)
        } else if (chosenTheme == 2) {
            emojiTheme = EmojiTheme(name: "Fruits", emojis: ["🍊", "🍌", "🍉", "🍓", "🍒", "🍍"], color: Color.blue)
        } else if (chosenTheme == 3) {
            emojiTheme = EmojiTheme(name: "Faces", emojis: ["😃", "😌", "🤓", "😂", "😉", "😎"], color: Color.red)
        } else if (chosenTheme == 4) {
            emojiTheme = EmojiTheme(name: "Sports", emojis: ["🏀", "🥎", "🏉", "🎱", "🏓", "🏒"], color: Color.white)
        }
        return MemoryGame<String>(numberOfPairOfCards: emojiTheme.noOfCards) {pairIndex in
            return emojiTheme.emojis![pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func score() -> Int {
        return model.score
    }
    
    func newGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    // MARK: - Structs
    
    struct EmojiTheme {
        var name: String?
        var emojis: Array<String>?
        let noOfCards: Int = Int.random(in: 2...5)
        var color: Color?
    }
    
}

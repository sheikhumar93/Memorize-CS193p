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
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🎃", "🕷", "🦇", "🐈"]
        let numberOfPairs = Int.random(in: 2...5)
        return MemoryGame<String>(numberOfPairOfCards: numberOfPairs) {pairIndex in
            return emojis[pairIndex]
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
}

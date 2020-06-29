//
//  MemoryGame.swift
//  Memorize
//
//  Created by Muhammad Umar on 6/28/20.
//  Copyright © 2020 Muhammad Umar. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose (card: Card) {
        print("Card Chosen: \(card)")
    }
    
    init(numberOfPairOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = true
        var content: CardContent
        var id: Int
    }
}

//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by WANKI KIM on 2021/10/29.
//

import SwiftUI
// Object
func makeCardContent(index: Int) -> String {
    return "🤩"
}

// View Model
class EmojiMemoryGame {
    static let emojis = ["😀", "😍", "😘", "😗","😋", "🤪","😝","🤓","😎","🥸","🤩","🥳","😏","😒","😞","😔","😟","😕","🙁","☹️","😣","😖","😫","😩","😢","😭","😤","😠"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairOfCards: 4) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }

    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    init(model: MemoryGame<String>) {
        self.model = model
    }
}

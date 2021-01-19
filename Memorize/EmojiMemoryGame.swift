//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Vincent Lin on 2021/1/5.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame<String>
    var theme: Theme
    var score: Int { model.score }
    
    init(){
        let theme = Theme.themes.randomElement()!
        self.theme = theme
        model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
    
    private static func createMemoryGame(with theme: Theme) -> MemoryGame<String> {
        
        // let emojis: Array<String> = ["👻","🎃","🕷","💀","🍬"]
        
        // Task 4
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...8)) { pairIndex in
            return theme.emojis[pairIndex]
        }
    }
    
    func resetGame() {
        let theme = Theme.themes.randomElement()!
        self.theme = theme
        model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
        
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
}

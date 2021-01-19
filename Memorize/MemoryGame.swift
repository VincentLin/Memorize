//
//  MemoryGame.swift
//  Memorize
//
//  Created by Vincent Lin on 2021/1/5.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    var score: Int = 0
    
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        print("current score: \(score)")
        
        let faceUpCardIndeces = cards.indices.filter { cards[$0].isFaceUp }
        
        if faceUpCardIndeces.count > 1 {
            for index in cards.indices {
                if cards[index].isFaceUp {
                    cards[index].alreadyBeenSeen = true
                    cards[index].isFaceUp = false
                }
            }
        }
        
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            
            cards[chosenIndex].isFaceUp = true
            if faceUpCardIndeces.count == 1 {
                
                if cards[faceUpCardIndeces[0]].content == cards[chosenIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[faceUpCardIndeces[0]].isMatched = true
                    
                    score += 2
                } else {
                    if cards[chosenIndex].alreadyBeenSeen {
                        score -= 1
                    }
                    if cards[faceUpCardIndeces[0]].alreadyBeenSeen {
                        score -= 1
                    }
                }

            }
            
            
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
            
            // Task 2
            cards.shuffle()
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var alreadyBeenSeen: Bool = false
        var content: CardContent
        var id: Int
    }
}


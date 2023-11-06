//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Peter on 05/11/23.
//

import Foundation


struct MemoryGame<CardContent> where CardContent: Equatable {
  private(set) var cards: [Card]
  
  var lastIndex: Int? {
    get {
      let indices = cards.indices.filter {!cards[$0].hidden}
      return indices.count == 1 ? indices.first : nil
    }
    
    set {
      cards.indices.forEach { index in
        cards[index].hidden = !(index == newValue)
      }
    }
  }
  
  init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
    cards = (0..<max(2, numberOfPairsOfCards)).map({ index in
      var cards: [Card] = []
      
      let content = cardContentFactory(index)
      
      cards.append(Card(content: content, id: "\(index + 1)a"))
      cards.append(Card(content: content, id: "\(index + 1)b"))
      
      return cards
      
    }).flatMap({ $0 }).shuffled()
  }
  
 
  mutating func choose(_ card: Card) {
    if let index = cards.firstIndex(of: card) {
      if cards[index].hidden && !cards[index].matched {
        
        if let lastIndex {
          if cards[lastIndex].content == cards[index].content {
            cards[lastIndex].matched = true
            cards[index].matched = true
          }
        } else {
          lastIndex = index
        }
        
        cards[index].hidden = false
      }
      
    }
  }
  
  mutating func shuffle() {
    cards.shuffle()
  }
}

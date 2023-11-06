//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Peter on 05/11/23.
//

import Foundation


struct MemoryGame<CardContent: Equatable> {
  private(set) var cards: [Card]
  
  init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
    cards = []

    for index in 0..<max(2, numberOfPairsOfCards) {
      let content = cardContentFactory(index)
      
      cards.append(Card(content: content))
      cards.append(Card(content: content))
    }
  }
  
  func index(after i: Int) -> Int {
    cards.index(after: i)
  }
  
  mutating func choose(at index: Int) {
    if index < 0 || index >= cards.count {
      return
    }
    
    var card = cards[index]
    cards[index] = card.toggle()
  }
  
  mutating func shuffle() {
    cards.shuffle()
  }
  
  struct Card: Equatable {
    var hidden = false
    var matched = false
    let content: CardContent
    
    mutating func toggle() -> Self {
      self.hidden = !hidden
      return self
    }
  }
}

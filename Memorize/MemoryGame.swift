//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Peter on 05/11/23.
//

import Foundation


struct MemoryGame<CardContent> {
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
  
  func choose(_ card: Card) {
    
  }
  
  mutating func shuffle() {
    cards.shuffle()
  }
  
  struct Card {
    var hidden = false
    var matched = false
    let content: CardContent
  }
}

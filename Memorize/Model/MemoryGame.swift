//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Peter on 05/11/23.
//

import Foundation


struct MemoryGame<CardContent> where CardContent: Equatable {
  private(set) var cards: [Card]
  
  init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
    cards = []

    for index in 0..<max(2, numberOfPairsOfCards) {
      let content = cardContentFactory(index)
      
      cards.append(Card(content: content, id: "\(index + 1)a"))
      cards.append(Card(content: content, id: "\(index + 1)b"))
    }
  }
  
  func index(after i: Int) -> Int {
    cards.index(after: i)
  }
  
  mutating func choose(_ card: Card) {
    if let index = cards.firstIndex(of: card) {
      var card = cards[index]
      card.hidden.toggle()
      cards[index] = card
    }
  }
  
  mutating func shuffle() {
    cards.shuffle()
  }
}
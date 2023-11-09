//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Peter on 05/11/23.
//

import Foundation


struct MemoryGame<CardContent> where CardContent: Equatable {
  private(set) var cards: [Card]
  var score = Score()
  
  var lastIndex: Int? {
    get {
      let indices = cards.indices.filter { !cards[$0].hidden }
      return indices.count == 1 ? indices.first : nil
    }
    
    set {
      cards.indices.forEach { index in
        cards[index].hidden = !(index == newValue)
      }
    }
  }
  
  init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
    cards = (0..<numberOfPairsOfCards).map({ index in
      var cards: [Card] = []
      
      let content = cardContentFactory(index)
      
      cards.append(Card(content: content, id: "\(index + 1)a"))
      cards.append(Card(content: content, id: "\(index + 1)b"))
      
      return cards
      
    }).flatMap({ $0 }).shuffled()
  }
  
  
  mutating func choose(_ card: Card) {
    guard let index = cards.firstIndex(of: card), cards[index].canPickUp else {
      return
    }
    
    let currentCard = cards[index];
    
    if let lastIndex {
      let lastCard = cards[lastIndex]
      
      if lastCard.content == currentCard.content {
        cards[lastIndex].matched = true
        cards[index].matched = true
        score.increment()
      } else {
        score.decrement()
      }
    } else {
      lastIndex = index
    }
    
    cards[index].hidden = false
    cards[index].seen = true
  }
  
  mutating func shuffle() {
    cards.shuffle()
  }
}

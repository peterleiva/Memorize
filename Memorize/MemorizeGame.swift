//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Peter on 05/11/23.
//

import Foundation


struct MemorizeGame<CardContent> {
  var cards: [Card]
  
  
  func choose(card: Card) {
    
  }
  
  struct Card {
    var hidden = false
    var matched = false
    var content: CardContent
  }
}

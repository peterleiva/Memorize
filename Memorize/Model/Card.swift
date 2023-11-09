//
//  Card.swift
//  Memorize
//
//  Created by Peter on 06/11/23.
//

import Foundation

extension MemoryGame {
  struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
    let content: CardContent
    var hidden = true
    var matched = false
    var seen = false
    
    var id: String
    
    var debugDescription: String {
      "\(id): \(content) \(hidden ? "↓" : "⬆️")\(seen ? " (👁️)" : "")"
    }
    
    var canPickUp: Bool {
      hidden && !matched
    }
    
    func match(to card: Card) -> Bool {
      content == card.content
    }
  }
}

//
//  Card.swift
//  Memorize
//
//  Created by Peter on 06/11/23.
//

import Foundation

extension MemoryGame {
  struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
    var debugDescription: String {
      "\(id): \(content) \(hidden ? "↓" : "⬆️")"
    }
    
    let content: CardContent
    var hidden = true
    var matched = false
    
    var id: String
  }
}

//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Peter on 05/11/23.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
  private static let emojis: [String] = CardData().emojis[.halloween] ?? []
    
  private static func createMemoryGame() -> MemoryGame<String> {
    return  MemoryGame(numberOfPairsOfCards: 10) { index in
      if emojis.indices.contains(index) {
        return emojis[index]
      } else {
        return "⁉️"
      }
    }
  }
  
  @Published
  private var model: MemoryGame<String>


  var cards: [MemoryGame<String>.Card] {
    model.cards
  }
  
  init() {
    model = EmojiMemoryGame.createMemoryGame()
    model.shuffle()
  }
  
//  MARK: - Intents
  
  func choose(_ card: MemoryGame<String>.Card) {
    model.choose(card)
  }
  
  func shuffle() -> Void {
    model = EmojiMemoryGame.createMemoryGame()
    model.shuffle()
    print(model.cards)
  }
}

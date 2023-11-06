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
  private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()


  var cards: [MemoryGame<String>.Card] {
    model.cards
  }
  
//  MARK: - Intents
  
  func choose(at index: Int) {
    model.choose(at: index)
  }
  
  func shuffle() -> Void {
    model.shuffle()
  }
}

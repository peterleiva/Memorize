//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Peter on 05/11/23.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
  private static var emojis: [String] = Emoji.byTheme(theme: .halloween)
    
  private static func createMemoryGame(theme: Theme = .halloween, pairs: Int = Int.max) -> MemoryGame<String> {
    emojis = Emoji.byTheme(theme: theme)
    let numberOfPairs = min(emojis.count, pairs)
    
    let game = MemoryGame(numberOfPairsOfCards: numberOfPairs) { index in
      emojis.indices.contains(index) ? emojis[index] : "⁉️"
    }
    
    return game
  }
  
  @Published
  private var model: MemoryGame<String>
  
  @Published
  var theme: Theme = .halloween
  
  
  @Published
  var themes: [Theme]


  var cards: [MemoryGame<String>.Card] {
    model.cards
  }
  
  var score: Int {
    model.score
  }
  
  init() {
    self.themes = Theme.allCases

    model = EmojiMemoryGame.createMemoryGame()
  }
  
//  MARK: - Intents
  
  func changeTheme(_ theme: Theme) {
    self.theme = theme
    model = EmojiMemoryGame.createMemoryGame(theme: theme)
  }
  
  func choose(_ card: MemoryGame<String>.Card) {
    model.choose(card)
  }
  
  func shuffle() -> Void {
    model.shuffle()
  }
}

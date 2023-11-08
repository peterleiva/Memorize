//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Peter on 05/11/23.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
  private static func createMemoryGame(theme: Theme = .halloween, pairs: Int = Int.max) -> MemoryGame<String> {
    let emojis = Emoji(pairs: pairs, theme: theme).emojis
    
    let game = MemoryGame(numberOfPairsOfCards: emojis.count) { emojis[$0] }
    
    return game
  }
  
  @Published
  private var memoryGame: MemoryGame<String>
  
  @Published
  var theme: Theme

  var cards: [MemoryGame<String>.Card] {
    memoryGame.cards
  }
  
  var score: Int {
    memoryGame.score.value
  }
  
  init() {
    let theme = Theme.allCases.randomElement() ?? .halloween
    self.theme = theme
    memoryGame = EmojiMemoryGame.createMemoryGame(theme: theme)
  }
  
  init(fromTheme theme: Theme) {
    self.theme = theme
    memoryGame = EmojiMemoryGame.createMemoryGame(theme: theme)
  }
  
//  MARK: - Intents
  
  func randomTheme() {
    theme = Theme.allCases.randomElement() ?? .halloween
    memoryGame = EmojiMemoryGame.createMemoryGame(theme: theme)
  }
  
  func changeTheme(_ theme: Theme) {
    self.theme = theme
    memoryGame = EmojiMemoryGame.createMemoryGame(theme: theme)
  }
  
  func choose(_ card: MemoryGame<String>.Card) {
    memoryGame.choose(card)
  }
  
  func shuffle() -> Void {
    memoryGame.shuffle()
  }
}

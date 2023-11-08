//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Peter on 01/11/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
  @StateObject var game = EmojiMemoryGame()

    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}

extension Array {
  /**
   * Repeats every single element of array by a certain number of times
   */
  func replicate(by times: Int) -> Self {
    let replicated = self.map({ Array(repeating: $0, count: times)  }).flatMap {$0}
    return replicated
  }
}

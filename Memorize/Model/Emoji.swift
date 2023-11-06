//
//  CardData.swift
//  Memorize
//
//  Created by Peter on 02/11/23.
//

import Foundation

struct Emoji {
  private static let MIN_DATA = 2

  private static let emojis: [Theme: [String]] = [
    .halloween: ["🤡", "👻", "🤖", "🎃", "💀", "🫵", "🧚", "🧠"],
    .animals: ["😺", "🙈", "🐸", "🦁", "🐼", "🐝", "🐍"],
    .people: ["😱", "🕵️", "👩‍🏫", "🧑‍🍳", "🧑‍💼"],
    .toys: ["🚁", "🛬", "⛵️", "🪖"]
  ]
  
  static func byTheme(theme: Theme) -> [String] {
    return emojis[theme] ?? []
  }
}

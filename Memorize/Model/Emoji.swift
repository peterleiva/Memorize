//
//  CardData.swift
//  Memorize
//
//  Created by Peter on 02/11/23.
//

import Foundation

struct Emoji {
  private static let MIN = 2;
  var pairs: Int = Int.max
  var theme: Theme = .halloween
  
  private let data: [Theme: Set<String>] = [
    .halloween: ["🤡", "👻", "🤖", "🎃", "💀", "🫵", "🧚", "🧠", "🦷", "👽"],
    .animals: ["😺", "🙈", "🐸", "🦁", "🐼", "🐝", "🐍"],
    .people: ["😱", "🕵️", "👩‍🏫", "🧑‍🍳", "🧑‍💼"],
    .toys: ["🚁", "🛬", "⛵️", "🪖"]
  ]
  
  var emojis: [String] {
    let set = data[theme]
    let count = Int.random(in: Emoji.MIN...min(set?.count ?? 2, pairs))
    let values = set?.shuffled().prefix(count)
    
    return Array(values ?? [])
  }
  
  
  func getEmojis(byTheme theme: Theme) -> [String] {
    return Array(data[theme] ?? [])
  }
}


//
//  CardData.swift
//  Memorize
//
//  Created by Peter on 02/11/23.
//

import Foundation

struct CardData {
  static let MIN_DATA = 2

  let emojis: [Theme: [String]] = [
    .halloween: ["🤡", "👻", "🤖", "🎃", "💀", "🫵", "🧚", "🧠"],
    .animals: ["😺", "🙈", "🐸", "🦁", "🐼", "🐝", "🐍"],
    .people: ["😱", "🕵️", "👩‍🏫", "🧑‍🍳", "🧑‍💼"],
    .toys: ["🚁", "🛬", "⛵️", "🪖"]
  ]
  
  func data(theme: Theme) -> [String] {
    let universe = emojis[theme] ?? []
    let choosen = Int.random(in: (CardData.MIN_DATA - 1)..<universe.count)
    print("choosen: \(choosen)")
    
    let res = universe.shuffled()[...choosen].map({item in [item, item]}).flatMap({i in i}).shuffled()
    
    print("result: \(res)")

    return res
  }
}

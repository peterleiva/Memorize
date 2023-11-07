//
//  CardView.swift
//  Memorize
//
//  Created by Peter on 01/11/23.
//

import SwiftUI

struct CardView: View {
  let card: MemoryGame<String>.Card

  
    var body: some View {
      ZStack {
        let base = RoundedRectangle(cornerRadius: 25)
        
        Group {
          base.fill(.white)
          base.strokeBorder(lineWidth: 2)
          textContent(card.content)
          card.matched ? textContent("❌") : nil
        }.opacity(card.hidden ? 0 : 1)
        
        base.fill().opacity(card.hidden && !card.matched ? 1 : 0)
      }
    }
  
  init(_ card: MemoryGame<String>.Card) {
    self.card = card
  }
  
  func textContent(_ data: String) -> some View {
    return Text(data)
      .font(.system(size: 200))
      .minimumScaleFactor(0.01)
      .aspectRatio(1, contentMode: .fit)
  }
}

#Preview {
  ForEach(Array(repeating: MemoryGame<String>.Card(content: "🦁", id: "some_id"), count: 2)
) { card in
    CardView(card)
      .padding(20)
      .foregroundStyle(.blue)
  }
}

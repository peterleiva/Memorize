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
        text
      }.opacity(card.hidden && !card.matched ? 0 : 1)
      
      base.fill().opacity(card.hidden && !card.matched ? 1 : 0)
      
      matchedText
    }
  }
  
  var text: some View {
    cardText(card.content)
  }
  
  var matchedText: some View {
    card.matched ? cardText("❌", size: 50) : nil
  }
  
  init(_ card: MemoryGame<String>.Card) {
    self.card = card
  }
  
  private func cardText(_ content: String, size: Int = 200) -> some View {
    return Text(content)
      .font(.system(size: CGFloat(size)))
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

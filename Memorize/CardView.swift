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
          Text(card.content)
            .font(.system(size: 200))
            .minimumScaleFactor(0.01)
            .aspectRatio(1, contentMode: .fit)
        }.opacity(card.hidden ? 0 : 1)
        
        base.fill().opacity(card.hidden ? 1 : 0)
        
      }
//      .onTapGesture {
//        toggle()
//      }
    }
  
  init(_ card: MemoryGame<String>.Card) {
    self.card = card
  }
}

#Preview {
  ForEach(0..<2, id: \.self) { _ in
    CardView(MemoryGame<String>.Card(content: "🦁"))
      .padding(20).foregroundStyle(.blue)
  }
}

//
//  ContentView.swift
//  Memorize
//
//  Created by Peter on 01/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var cardCount = 4
    let emojis = ["🤡", "👻", "🤖", "🎃", "💀", "🫵", "🧚", "🧠"]
  
    var body: some View {
      VStack {
        ScrollView {
          cards
        }

        Spacer()
        cardAdjuster
      }
      .padding(10)
    }
  
  var cards: some View {
    LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
      ForEach(0..<cardCount, id: \.self) {
        CardView(content: emojis[$0])
          .aspectRatio(2/3, contentMode: .fit)
      }
    }
    .foregroundStyle(.orange)
  }
  
  var cardAdjuster: some View {
    HStack {
      btnRemove
      Spacer()
      btnAdd
    }
    .imageScale(.large)
    .font(.title)
    .padding(.all, 20.0)
  }
  
  var btnAdd: some View {
    cardCounterAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
  }
  
  var btnRemove: some View {
    cardCounterAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
  }
  
  func cardCounterAdjuster(by offset: Int, symbol: String) -> some View {
    Button(action: {
      let value = cardCount + offset
      
      if offset >= 0 {
        cardCount = min(emojis.count, value)
      } else {
        cardCount = max(0, value)
      }
    }, label: {
      Image(systemName: symbol)
    }).disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
  }
}

#Preview {
    ContentView()
}

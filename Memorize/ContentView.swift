//
//  ContentView.swift
//  Memorize
//
//  Created by Peter on 01/11/23.
//

import SwiftUI

enum Flavor: String, CaseIterable, Identifiable {
  case halloween, people, animals
  var id: Self { self }
}

struct ContentView: View {
  @State var cardCount = 1

  let emojis: [Flavor: [String]] = [
    .halloween: ["🤡", "👻", "🤖", "🎃", "💀", "🫵", "🧚", "🧠"],
    .animals: ["😺", "😺", "😺", "😺", "😺", "😺", "😺", "😺"],
    .people: ["😱", "😱", "😱", "😱", "😱", "😱"]
  ]
  
  @State private var selectedFlavor: Flavor = .halloween
  
  let tapOpt = Binding<Flavor>(
    get: {
      selectedFlavor
    },
    
    set: {
      selectedFlavor = $0
    }
  )

  
    var body: some View {
      VStack {
        Text("Memorize!").font(.largeTitle)
        
        ScrollView { cards }
        Spacer()
        cardAdjuster
      }
      .padding(10)
    }
  
  var cards: some View {
    let items = emojis[selectedFlavor]!
    
    return LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
      ForEach(0..<cardCount, id: \.self) { index in
        CardView(content: items[index])
          .aspectRatio(2/3, contentMode: .fit)
      }
    }
    .foregroundStyle(.orange)
  }
  
  var cardAdjuster: some View {
    HStack {
      btnRemove
      themeChooser
      btnAdd
    }
    .imageScale(.large)
    .font(.title)
    .padding(.all, 20.0)
  }
  
  var themeChooser: some View {
    Picker("Flavor", selection: tapOpt) {
      ForEach(Flavor.allCases) { flavor in
        Text(flavor.rawValue.capitalized)
      }
    }.pickerStyle(.segmented)
      .onChange(of: selectedFlavor) { selected in
        print("contagem: \(cardCount)")
        cardCount = 0
      }
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
        cardCount = min(emojis[selectedFlavor]?.count ?? 0, value)
      } else {
        cardCount = max(0, value)
      }
    }, label: {
      Image(systemName: symbol)
    }).disabled(cardCount + offset < 1 || cardCount + offset > emojis[selectedFlavor]?.count ?? 0)
  }
}

#Preview {
    ContentView()
}

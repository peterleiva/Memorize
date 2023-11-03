//
//  ContentView.swift
//  Memorize
//
//  Created by Peter on 01/11/23.
//

import SwiftUI


struct ContentView: View {
  @State private var selectedTheme: Theme = .halloween
  @State var data: [String] = CardData().data(theme: .halloween)
  
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
    return LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
      ForEach(0..<data.count, id: \.self) { index in
        CardView(content: data[index])
          .aspectRatio(2/3, contentMode: .fit)
      }
    }
    .foregroundStyle(selectedTheme.color())
  }
  
  var cardAdjuster: some View {
    HStack(spacing: 30) {
//      btnRemove
      cardThemeChoose
//      btnAdd
    }
    .imageScale(.large)
    .padding()
  }
    
  var cardThemeChoose: some View {
    HStack {
      ForEach(Theme.allCases, id: \.self) { theme in
        themeBtn(theme, label: theme.rawValue.capitalized, symbol: theme.symbol())
      }
    }
  }
    
  func themeBtn(_ theme: Theme, label: String, symbol: String) -> some View {
    Button(action: {
      data = CardData().data(theme: theme)
      selectedTheme = theme
      print("theme: \(data)")
    }, label: {
      VStack(alignment: .center) {
        Image(systemName: symbol)
        Text(label)
      }
    })
    .disabled(theme == selectedTheme)
  }

//  var btnAdd: some View {
//    cardCounterAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
//  }
//  
//  var btnRemove: some View {
//    cardCounterAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
//  }
  
//  func cardCounterAdjuster(by offset: Int, symbol: String) -> some View {
//    Button(action: {
//      let value = cardCount + offset
//      
//      if offset >= 0 {
//        cardCount = min(data.count, value)
//      } else {
//        cardCount = max(0, value)
//      }
//    }, label: {
//      Image(systemName: symbol)
//    }).disabled(cardCount + offset < 1 || cardCount + offset > data.count)
//  }
}

#Preview {
    ContentView()
}

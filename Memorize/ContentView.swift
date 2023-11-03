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
    return LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatBestFits()))]) {
      ForEach(0..<data.count, id: \.self) { index in
        CardView(content: data[index])
          .aspectRatio(2/3, contentMode: .fit)
      }
    }
    .foregroundStyle(selectedTheme.color())
  }
  
  var cardAdjuster: some View {
      cardThemeChoose.padding()
  }
    
  var cardThemeChoose: some View {
    HStack(spacing: 40) {
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
        Image(systemName: symbol).imageScale(.large).font(.title)
        Text(label).font(.caption)
      }
    })
    .disabled(theme == selectedTheme)
  }
  
  func widthThatBestFits() -> CGFloat {
    return CGFloat(120)
  }
}

#Preview {
    ContentView()
}

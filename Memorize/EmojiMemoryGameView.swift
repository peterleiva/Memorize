//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Peter on 01/11/23.
//

import SwiftUI


struct EmojiMemoryGameView: View {
  @State private var selectedTheme: Theme = .halloween
  @State var data: [String] = CardData().data(theme: .halloween)
  @ObservedObject var viewModel: EmojiMemoryGame
  
    var body: some View {
      VStack {
        Text("Memorize!").font(.largeTitle)
        
        ScrollView { cards }
        Spacer()
        shuffleBtn
//        cardAdjuster
      }
      .padding(10)
    }
  
  var cards: some View {
    return LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatBestFits()), spacing: 0)], spacing: 0) {
      ForEach(viewModel.cards.indices, id: \.self) { index in
        CardView(viewModel.cards[index])
          .aspectRatio(2/3, contentMode: .fit)
          .padding(4)
      }
    }
    .foregroundStyle(selectedTheme.color())
  }
  
  var shuffleBtn: some View {
    Button("Shuffle") {
      viewModel.shuffle()
    }
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
    }, label: {
      VStack(alignment: .center) {
        Image(systemName: symbol).imageScale(.large).font(.title)
        Text(label).font(.caption)
      }
    })
    .disabled(theme == selectedTheme)
  }
  
  func widthThatBestFits() -> CGFloat {
    CGFloat(85)
  }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}

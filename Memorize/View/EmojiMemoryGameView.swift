//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Peter on 01/11/23.
//

import SwiftUI


struct EmojiMemoryGameView: View {
  @ObservedObject var viewModel: EmojiMemoryGame
  
  var score: Int {
    viewModel.score
  }
  
  var selectedTheme: Theme {
    viewModel.theme
  }
  
    var body: some View {
      VStack  {
        Text("Score: \(score)").font(.largeTitle).fontWeight(.semibold).foregroundStyle(score >= 0 ? .green : .red)
        
        ScrollView {
          cards.animation(.default, value: viewModel.cards)
        }
        
        newGameBtn.foregroundStyle(.white).background(.blue).buttonBorderShape(.roundedRectangle)
      }
      .padding(10)
    }
  
  var cards: some View {
    return LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatBestFits()), spacing: 0)], spacing: 0) {
      ForEach(viewModel.cards) { card in
        
        CardView(card)
          .aspectRatio(2/3, contentMode: .fit)
          .padding(4)
          .onTapGesture {
            viewModel.choose(card)
          }
      }
    }
    .foregroundStyle(selectedTheme.color())
  }
  
  var newGameBtn: some View {
    Button("New Game") {
      viewModel.randomTheme()
    }
  }
  
  var cardAdjuster: some View {
      cardThemeChoose.padding()
  }
    
  var cardThemeChoose: some View {
    HStack(spacing: 40) {
      ForEach(Theme.allCases) { theme in
        themeBtn(theme, label: theme.rawValue.capitalized, symbol: theme.symbol())
      }
    }
  }
    
  func themeBtn(_ theme: Theme, label: String, symbol: String) -> some View {
    Button(action: {
      viewModel.changeTheme(theme)
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

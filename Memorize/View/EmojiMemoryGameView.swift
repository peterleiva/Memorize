//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Peter on 01/11/23.
//
//

import SwiftUI


struct EmojiMemoryGameView: View {
  @ObservedObject var game: EmojiMemoryGame
  
  var score: Int {
    game.score
  }
  
  var selectedTheme: Theme {
    game.theme
  }
  
    var body: some View {
      VStack  {
        HStack(alignment: .top) {
          themeIcon(selectedTheme)

          Spacer()
          
          Text("Score: \(score)").font(.largeTitle).fontWeight(.semibold).foregroundStyle(score >= 0 ? .green : .red)
        }.padding(10)
        
        ScrollView {
          cards.animation(.default, value: game.cards)
        }
        
        newGameBtn
      }
      .padding(10)
    }
  
  var cards: some View {
    return LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatBestFits()), spacing: 0)], spacing: 0) {
      ForEach(game.cards) { card in
        
        CardView(card)
          .aspectRatio(2/3, contentMode: .fit)
          .padding(4)
          .onTapGesture {
            game.choose(card)
          }
      }
    }
    .foregroundStyle(selectedTheme.color())
  }
  
  var newGameBtn: some View {
    Button("New Game") {
      game.randomTheme()
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
      game.changeTheme(theme)
    }, label: { themeIcon(theme) })
    .disabled(theme == selectedTheme)
  }
  
  func themeIcon(_ theme: Theme) -> some View {
    VStack(alignment: .center) {
      Image(systemName: theme.symbol()).imageScale(.large).font(.title)
      Text(theme.name).font(.caption)
    }
  }
  
  func widthThatBestFits() -> CGFloat {
    CGFloat(85)
  }
}

#Preview {
    EmojiMemoryGameView(game: EmojiMemoryGame())
}

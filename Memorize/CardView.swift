//
//  CardView.swift
//  Memorize
//
//  Created by Peter on 01/11/23.
//

import SwiftUI

struct CardView: View {
  let content: String
  
  @State var hidden = false
  
    var body: some View {
      ZStack {
        let base = RoundedRectangle(cornerRadius: 25)
        
        Group {
          base.fill(.white)
          base.strokeBorder(lineWidth: 2)
          Text(content).font(.largeTitle)
        }.opacity(hidden ? 0 : 1)
        
        base.fill().opacity(hidden ? 1: 0)
        
      }
      .onTapGesture {
        toggle()
      }
    }
  
  func toggle() {
    hidden = !hidden
  }
}

#Preview {
  CardView (content: "🎃")
    .padding(20).foregroundStyle(.blue)
}

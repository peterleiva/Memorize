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
        
        if !hidden {
          base.fill(.white)
          base.strokeBorder(lineWidth: 2)
          Text(content).font(.largeTitle)
        } else {
          base.fill()
        }
        
      }
      .foregroundStyle(.orange)
      .padding()
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
}

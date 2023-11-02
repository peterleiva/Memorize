//
//  ContentView.swift
//  Memorize
//
//  Created by Peter on 01/11/23.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🤡", "👻", "🤖", "🎃"]
  
    var body: some View {
      HStack {
        ForEach(emojis.indices, id: \.self) {
          CardView(content: emojis[$0])
        }
      }
    }
}

#Preview {
    ContentView()
}
